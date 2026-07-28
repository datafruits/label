#!/usr/bin/env ruby
# frozen_string_literal: true

# Fetches the DATAFRUITS releases + artist-list Google Sheets (as TSV) and
# writes normalized, canonical-field snapshots to data/releases.yml and
# data/artists.yml. Run manually whenever the spreadsheet changes, then
# commit the resulting YAML and rebuild the site:
#
#   ruby bin/fetch_releases.rb
#   bundle exec middleman build
#
# No derived/presentational fields (catalog numbers, search text, "new"
# badges, sort order) are written here — those depend on the current date
# and are computed at Middleman render time in config.rb.

require "csv"
require "fileutils"
require "net/http"
require "uri"
require "yaml"

RELEASES_SHEET_URL = ENV.fetch(
  "DATAFRUITS_TSV_URL",
  "https://docs.google.com/spreadsheets/d/1Ri22Wj-FmM0lK63KstmzFGFtE5XPIsvwbybxUFW7B_Q/edit?gid=0#gid=0",
)
ARTISTS_SHEET_URL = ENV.fetch(
  "DATAFRUITS_ARTISTS_URL",
  "https://docs.google.com/spreadsheets/d/1Ri22Wj-FmM0lK63KstmzFGFtE5XPIsvwbybxUFW7B_Q/edit?gid=459498689#gid=459498689&range=B:B",
)

ROOT = File.expand_path("..", __dir__)
DATA_DIR = File.join(ROOT, "data")

HEADER_ALIASES = {
  "catalog" => ["catalog_id", "catalog ID", "catalog", "catalog_no", "catalogue", "cat", "id", "number", "品番"],
  "artist" => ["artist", "artists", "アーティスト", "artist_name"],
  "title" => ["title", "release", "album", "name", "リリース", "タイトル"],
  "release_date" => ["date", "release_date", "released", "発売日", "リリース日"],
  "cover" => ["image_url", "image URL", "image", "cover", "artwork", "jacket", "画像", "ジャケット"],
  "url" => ["url", "link", "bandcamp", "purchase", "listen", "リンク"],
  "series" => ["series", "series_name", "label", "collection", "シリーズ"],
  "format" => ["package", "format", "type", "フォーマット"],
  "tags" => ["tags", "tag", "genre", "genres", "タグ", "ジャンル"],
  "description" => ["description", "notes", "note", "memo", "説明", "メモ"],
  "tracklist" => ["track_list", "tracklist", "track list", "tracks", "曲目", "トラックリスト"],
  "credit" => ["credit", "credits", "liner_notes", "liner notes", "クレジット"],
}.freeze

def normalize_header(value)
  value.to_s.strip.downcase.gsub(/[\s-]+/, "_")
end

def normalize_lookup_value(value)
  value.to_s.unicode_normalize(:nfkc).strip.gsub(/\s+/, " ").downcase
end

def google_sheet_gid(uri)
  query = URI.decode_www_form(uri.query || "").to_h
  return query["gid"] if query["gid"]

  match = (uri.fragment || "").match(/gid=(\d+)/)
  match ? match[1] : "0"
end

def google_sheet_range(uri)
  query = URI.decode_www_form(uri.query || "").to_h
  return query["range"] if query["range"]

  URI.decode_www_form(uri.fragment || "").to_h["range"]
end

def normalize_source_url(source)
  uri = URI.parse(source)
  sheet_match = uri.path.match(%r{/spreadsheets/d/([^/]+)})
  return uri.to_s unless uri.host == "docs.google.com" && sheet_match

  export_uri = URI.parse("https://docs.google.com/spreadsheets/d/#{sheet_match[1]}/export")
  params = { "format" => "tsv", "gid" => google_sheet_gid(uri) }
  range = google_sheet_range(uri)
  params["range"] = range if range
  export_uri.query = URI.encode_www_form(params)
  export_uri.to_s
end

def fetch_text(url, redirects_left = 5)
  raise "Too many redirects fetching #{url}" if redirects_left.zero?

  uri = URI.parse(url)
  response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
    http.get(uri.request_uri)
  end

  case response
  when Net::HTTPSuccess
    response.body.dup.force_encoding("UTF-8")
  when Net::HTTPRedirection
    fetch_text(response["location"], redirects_left - 1)
  else
    raise "HTTP #{response.code} fetching #{url}"
  end
end

def parse_tsv(text)
  CSV.parse(text, col_sep: "\t").reject do |row|
    row.nil? || row.all? { |cell| cell.to_s.strip.empty? }
  end
end

def load_rows(sheet_url)
  parse_tsv(fetch_text(normalize_source_url(sheet_url)))
end

def row_to_hash(headers, record)
  headers.each_with_index.each_with_object({}) do |(header, index), hash|
    hash[normalize_header(header)] = record[index].to_s.strip
  end
end

def get_field(row, key)
  (HEADER_ALIASES[key] || [key]).each do |name|
    value = row[normalize_header(name)]
    return value.strip if value && !value.strip.empty?
  end
  ""
end

def parse_release_text(text)
  trimmed = text.to_s.strip
  match = trimmed.match(/\A(DF|DV|DATAVEGETABLES)\s*0?(\d{1,3})\s*-\s*(.+)\z/i)
  if match
    catalog = "#{match[1].upcase}#{match[2].rjust(3, '0')}"
    rest = match[3]
  else
    catalog = ""
    rest = trimmed
  end

  parts = rest.split(/\s+-\s+/)
  if parts.length >= 2
    { catalog: catalog, artist: parts[0..-2].join(" - ").strip, title: parts[-1].strip }
  else
    { catalog: catalog, artist: "", title: rest }
  end
end

def split_tags(value)
  value.to_s.split(/[|,;]+/).map(&:strip).reject(&:empty?).first(8)
end

def extract_release(row, index)
  combined = get_field(row, "title")
  parsed = parse_release_text(combined)
  artist_field = get_field(row, "artist")
  title_field = get_field(row, "title")

  catalog = get_field(row, "catalog")
  catalog = parsed[:catalog] if catalog.empty?
  catalog = "ROW#{format('%03d', index + 1)}" if catalog.empty?

  artist = artist_field.empty? ? parsed[:artist] : artist_field
  artist = "Unknown artist" if artist.empty?

  title = (!title_field.empty? && !artist_field.empty?) ? title_field : parsed[:title]
  title = combined if title.to_s.strip.empty?
  title = catalog if title.to_s.strip.empty?

  {
    "catalog" => catalog,
    "artist" => artist,
    "title" => title,
    "release_date" => get_field(row, "release_date"),
    "cover" => get_field(row, "cover"),
    "url" => get_field(row, "url"),
    "series" => get_field(row, "series"),
    "format" => get_field(row, "format"),
    "tags" => split_tags(get_field(row, "tags")),
    "description" => get_field(row, "description"),
    "tracklist" => get_field(row, "tracklist"),
    "credit" => get_field(row, "credit"),
  }
end

def extract_artists(rows)
  rows.map { |record| record[0].to_s.strip }
      .reject { |artist| artist.empty? || normalize_lookup_value(artist) == "sorted artist" }
end

def main
  release_rows = load_rows(RELEASES_SHEET_URL)
  headers = release_rows.shift || []
  releases = release_rows.each_with_index.map do |record, index|
    extract_release(row_to_hash(headers, record), index)
  end

  artists = extract_artists(load_rows(ARTISTS_SHEET_URL))

  FileUtils.mkdir_p(DATA_DIR)
  File.write(File.join(DATA_DIR, "releases.yml"), releases.to_yaml)
  File.write(File.join(DATA_DIR, "artists.yml"), artists.to_yaml)

  puts "Wrote #{releases.length} releases to data/releases.yml"
  puts "Wrote #{artists.length} artists to data/artists.yml"
end

main if $PROGRAM_NAME == __FILE__
