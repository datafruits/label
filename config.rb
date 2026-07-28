require "date"
require "json"

set :tracks, [
  {:num => "01",
   :track => "01. Firedrill ✰ MINIBURGERTIME (original mix)",
   :mp3 => "01-firedrill-miniburgertime_original_mix.mp3"},
  {:num => "02",
   :track => "02. Dr. Akane ✰ MINIBURGERTIME (cafeteria mix)",
   :mp3 => "02-dr_akane-miniberg.mp3"},
  {:num => "03",
   :track => "03. Freedrull ✰ MINIBURGERTIME (shed mix)",
   :mp3 => "03-freedrull-miniburgertime_shed_mix.mp3"},
  {:num => "04",
   :track => "04. CRZKNY ✰ MINIBURGERTIME (hiroshima fwk mix)",
   :mp3 => "04-CRZKNY-miniburgertime_hiroshima_fwk_remix.mp3"},
  {:num => "05",
   :track => "05. Freedrull ✰ MINIBURGERTIME (real miniburger shit)",
   :mp3 => "05-freedrull-miniburgertime_real_miniburger_shit.mp3"},
  {:num => "06",
   :track => "06. Freedrull ✰ MINIBURGERTIME (minicanadianburger)",
   :mp3 => "06-freedrull-miniburgertime_minicandianburger.mp3"},
  {:num => "07",
   :track => "07. Abducted By Sharks ✰ MINIBURGERTIME (teo mix)",
   :mp3 => "07-abducted_by_sharks-miniburgertime_teo_remix.mp3"},
  {:num => "08",
   :track => "08. Ovenrake ✰ MINIBURGERTIME (burgerdik mix)",
   :mp3 => "08-ovenrake-miniburgertime_burgerdik_mix.mp3"},
  {:num => "09",
   :track => "09. Ridylan ✰ MINIBURGERTIME (ridylan remix)",
   :mp3 => "09-ridylan-miniburgertime_ridylan_remix.mp3"},
  {:num => "10",
   :track => "10. DKSTR ✰ MINIBURGERTIME (DKSTR Paussi Special remix)",
   :mp3 => "10-dkstr-miniburgertime_dkstr_paussi_special_remix.mp3"}
]

set :foods, ["img/burger1.png","img/eggsaladsandwich.png","img/jellyburger.png","img/sloppyjoe.png"]

set :df004, [
  {:num => "01",
    :track => "01. GRIME OF FUTURE PAST",
   :mp3 => "01-sea_cuke-grime_of_future_past.mp3"},
  {:num => "02",
   :track => "02. GARAGE CLUB",
   :mp3 => "02-sea_cuke-garage_club.mp3"},
  {:num => "03",
   :track => "03. FIREDRILL - SLURPIT (SEA CUKE REMIX)",
   :mp3 => "03-firedrill-slurpit_sea_cuke_remix.mp3"}
]

set :df005, [
  {:num => "01",
   :track => "firedrill - pineapple bog",
   :mp3 => "01_firedrill_pineapple-bog.mp3",
  :image => "https://s3.amazonaws.com/DF005/img/pineapple.jpg"},
  {:num => "02",
   :track => "ovenrake - ult bem bem",
   :mp3 => "02_ovenrake_ultbembem.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/back295.jpg"},
  {:num => "03",
   :track => "korma - BB6600",
   :mp3 => "03_Korma_BB6600.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/person_with_pouting_face.png"},
  {:num => "04",
   :track => "firedrill - w!ld remix",
   :mp3 => "04_firedrill_w!ld_grime_remix.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/datafruits.jpg"},
  {:num => "05",
   :track => "mojogoro - I LUV U remix",
   :mp3 => "05_mojogoro_I+LUV+U+MOJOGORO+RMX.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/postcard1.png"},
  {:num => "06",
   :track => "the ghost potemkin - deeper boy",
   :mp3 => "06_the-ghost-potemkin_DeeperBoy.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/seeponk.png"},
  {:num => "07",
   :track => "ind_fris - willie",
   :mp3 => "07_ind-fris_Willie.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/drips.png"},
  {:num => "08",
   :track => "carpainter - heat up",
   :mp3 => "08_Carpainter_HeatUp.mp3",
   :image => "https://s3.amazonaws.com/DF005/img/train.jpg"},
  {:num => "09",
   :track => "peaches the whale - wot u call it (boat shed)",
   :mp3 => "09_peaches-the-whale_wot+u+call+it+(boat+shed).mp3",
   :image => "https://s3.amazonaws.com/DF005/img/efm.jpg"}
]

set :df006, [
  {:num => "01",
   :track => "herokkin remix",
   :mp3 => "01_DooDaDoo_Herokkin-Remix.mp3"},
  {:num => "02",
   :track => "DJ DAI remix",
   :mp3 => "02_DooDaDoo_DJ-DAI-REMIX.mp3"},
  {:num => "03",
   :track => "firedrill remix",
   :mp3 => "03_DooDaDoo_firedrill-remix.mp3"},
  {:num => "04",
   :track => "ovenrake remix",
   :mp3 => "04_DooDaDoo_ovenrake-remix.mp3"},
  {:num => "05",
   :track => "seacuke remix",
   :mp3 => "05_DooDaDoo_seacuke-remix.mp3"},
  {:num => "06",
   :track => "dj nameko edit",
   :mp3 => "06_DooDaDoo_dj-nameko-edit.mp3"}
]

set :df007, [
  {:num => "01",
   :track => "falling girl",
   :mp3 => "01_falling_girl.mp3"},
  {:num => "02",
   :track => "cute garage",
   :title => "cute garage",
   :mp3 => "02_cute_garage.mp3"},
  {:num => "03",
   :track => "immi - local train (last train remix)",
   :mp3 => "03_local_train_last_train_remix.mp3"},
   {:num => "04",
    :track => "owatta",
    :mp3 => "04_owatta.mp3"}
]

set :df008, [
  {:num => "01",
   :track => "firedrill - freaky freestyley cafe",
   :mp3 => "01_firedrill_funky-freestyle-cafe.mp3"},
  {:num => "02",
   :track => "ovenrake - Funkfreak'fterhoursmix",
   :mp3 => "02_ovenrake_Funkfreak'fterhoursmix.mp3"},
  {:num => "03",
   :track => "kosmo kat - loving tony is like a pineapple heaven",
   :mp3 => "03_kosmocat_loving-tony-is-like-a-pineapple-heaven.mp3"},
  {:num => "04",
   :track => "goto80 - vatican power loop",
   :mp3 => "04_goto80_vactican-power-loop.mp3"},
  {:num => "05",
   :track => "smoked meat fax machine - shut it down",
   :mp3 => "05_smoked-meat-fax-machine_shut-it-down.mp3"},
  {:num => "06",
   :track => "dr vector - fresh 90",
   :mp3 => "06_dr-vector_fresh90.mp3"},
  {:num => "07",
   :track => "herokkin - bits are bits",
   :mp3 => "07_herokkin_bits-are-bits.mp3"},
  {:num => "08",
   :track => "ghost colours - People (Soopa Mix)",
   :mp3 => "08_ghost-colours_people-soopa-mix.mp3"},
  {:num => "09",
   :track => "uzzlang pistol - PASTEL女の子",
   :mp3 => "09_ulzzang-pistol_PASTEL-女の子.mp3"},
  {:num => "10",
   :track => "urabukki - sunset vibes",
   :mp3 => "10_urabukki_sunset-vibes.mp3"},
]

set :df009, [
  {
    num: '01',
    track: 'FBEM',
    mp3: '01_FBEM.mp3'
  },
  {
    num: '02',
    track: 'AJIHA',
    mp3: '02_AJIHA.mp3'
  },
  {
    num: '03',
    track: 'D0GEZ00',
    mp3: '03_D0GEZ00.mp3'
  },
  {
    num: '04',
    track: 'H2USE',
    mp3: '04_H2USE.mp3'
  },
  {
    num: '05',
    track: 'D1MBEM',
    mp3: '05_D1MBEM.mp3'
  },
  {
    num: '06',
    track: 'FBEM (track)',
    mp3: '06_FBEM_(track).mp3'
  },
  {
    num: '07',
    track: 'AJIHA (track)',
    mp3: '07_AJIHA_(track).mp3'
  },
  {
    num: '08',
    track: 'D0GEZ00 (track)',
    mp3: '08_D0GEZ00_(track).mp3'
  },
  {
    num: '09',
    track: 'H2USE (track)',
    mp3: '09_H2USE_(track).mp3'
  },
  {
    num: '10',
    track: 'D1MBEM (track)',
    mp3: '10_D1MBEM_(track).mp3'
  },
]

set :df010, [
  {
    num: '01',
    track: 'X-O (Pete Ellison Remix)',
    mp3: '01_X-O_(Pete_Ellison_Remix).mp3'
  },
  {
    num: '02',
    track: 'Midnight Confusion (Firedirll Remix)',
    mp3: '02_Midnight_Confusion_(Firedrill_Remix).mp3'
  },
]

set :df011, [
  {
    num: '01',
    track: 'Lumberjack 2 The Sound (Side A)',
    mp3: '01 Lumberjack 2 The Sound (Side A).mp3',
  },
  {
    num: '02',
    track: 'Who Bootlegged',
    mp3: '02 Who Bootlegged_.mp3',
  },
  {
    num: '03',
    track: 'My Ting-A-Ling',
    mp3: '03 My Ting-A-Ling.mp3',
  },
  {
    num: '04',
    track: 'Repeat Pete Pete',
    mp3: '04 Repeat Pete Pete.mp3',
  },
  {
    num: '05',
    track: 'Lumberjack 2 The Sound (Side B)',
    mp3: '05 Lumberjack 2 The Sound (Side B).mp3',
  },
  {
    num: '06',
    track: 'Firedrill - Cute Garage (Pete Ellison Remix)',
    mp3: '06 Cute Garage (Pete Ellison Remix).mp3',
  },
]

set :df012, [
  {
    num: '01',
    track: 'INDIADUB',
    mp3: '01_INDIADUB-ovenrake.mp3',
  },
  {
    num: '02',
    mp3: '02_PROGDUB-ovenrake.mp3',
    track: 'PROGDUB',
  },
  {
    num: '03',
    mp3: '03_HORRORDUB-ovenrake.mp3',
    track: 'HORRORDUB',
  },
  {
    num: '04',
    track: 'DEADDUB(m00nt0ne edit)',
    mp3: '04_DEADDUB-ovenrake(m00nt0ne edit).mp3',
  },
]

set :df014, [
  {
    num: '01',
    track: 'Wau (Original Club Mix)',
    mp3: '01_seacuke_wau_original_club_mix.mp3'
  },
  {
    num: '02',
    track: 'Wau (Firedrill Melody Mix)',
    mp3: '02_seacuke_wau_firedrill_melody_mix.mp3'
  },
  {
    num: '03',
    track: 'Wau (Deep Wau Mix)',
    mp3: '03_seacuke_wau_deep_wau_mix.mp3'
  },
  {
    num: '04',
    track: 'Wau (Amps Remix)',
    mp3: '04_seacuke_wau_amps_remix.mp3'
  },
  {
    num: '05',
    track: 'Wau (Pete Ellison Remix)',
    mp3: '05_seacuke_wau_pete_ellison_remix.mp3'
  },
  {
    num: '06',
    track: 'Wau (California Games 160 Edit)',
    mp3: '06_seacuke_wau_california_games_160_edit.mp3'
  },
]

set :df015, [
  {
    num: '01',
    track: 'Hundredandtoo',
    mp3: '01_peaches_the_wale_hundredandtoo.mp3'
  },
  {
    num: '02',
    track: 'Magical Girl',
    mp3: '02_peaches_the_wale_magical_girl.mp3'
  },
  {
    num: '03',
    track: 'Family (Dad Knows Best Juke Edit)',
    mp3: '03_peaches_the_wale_family_dad_knows_best_juke_edit.mp3'
  },
  {
    num: '04',
    track: 'I Know (Peaches Breaks Edit)',
    mp3: '04_peaches_the_wale_i_know_peaches_breaks_edit.mp3'
  },
  {
    num: '05',
    track: 'Pon de Waves',
    mp3: '05_peaches_the_wale_pon_de_waves.mp3'
  },
  {
    num: '06',
    track: 'Junglesea Flukework',
    mp3: '06_peaches_the_wale_junglesea_flukework.mp3'
  },
  {
    num: '07',
    track: 'Kpopped Collars',
    mp3: '07_peaches_the_wale_kpopped_collars.mp3'
  },
  {
    num: '08',
    track: 'Magical Girl (california games remix)',
    mp3: '08_peaches_the_wale_magical_girl_california_games_remix.mp3'
  },
  {
    num: '09',
    track: 'Magical Girl (firedrill remix)',
    mp3: '09_peaches_the_wale_magical_girl_firedrill_remix.mp3'
  },
  {
    num: '10',
    track: 'Hundredandtoo (melt unit remix)',
    mp3: '10_peaches_the_wale_hundredandtoo_melt_unit_remix.mp3'
  },
]

set :df020, [
  {
    num: '01',
    track: 'FIREDRILL',
    mp3: '01_firedrill_club_nap_original.mp3'
  },
  {
    num: '02',
    track: 'DJ NHK GUY',
    mp3: '02_firedrill_club_nap_dj_nhk_guy_remix.mp3'
  },
  {
    num: '03',
    track: 'FORK & KNIFE',
    mp3: '03_firedrill_club_nap_fork_and_knife_remix.mp3'
  },
  {
    num: '04',
    track: 'YUMEKA',
    mp3: '04_firedrill_club_nap_yumeka_ghetto_edit.mp3'
  },
  {
    num: '05',
    track: 'GORO',
    mp3: '05_firedrill_club_nap_goro_remix.mp3'
  },
  {
    num: '06',
    track: "FIREDRILL'S REALLY SLEEPY VIP",
    mp3: '06_firedrill_club_nap_really_sleepy_vip.mp3'
  },
  {
    num: '07',
    track: '7777777',
    mp3: '07_firedrill_club_nap_7777777_remix.mp3'
  },
  {
    num: '08',
    track: 'MONDAY STUDIO',
    mp3: '08_firedrill_club_nap_mondaystudio_remix.mp3'
  },
  {
    num: '09',
    track: 'YOSHINO YOSHIKAWA',
    mp3: '09_firedrill_club_nap_yoshino_yoshikawa_remix.mp3'
  }
]

set :df022, [
  {
    num: '01',
    track: 'ブルー・スカイ・ブルー',
    mp3: '01 ブルー・スカイ・ブルー.mp3'
  },
  {
    num: '02',
    track: '音楽より遠く',
    mp3: '02 音楽より遠く.mp3'
  },
  {
    num: '03',
    track: 'くらしのけいざい',
    mp3: '03 くらしのけいざいく.mp3'
  },
  {
    num: '04',
    track: '真夜中・物流（DJ港302REMIX）',
    mp3: '04 真夜中・物流（DJ港302REMIX）.mp3'
  },
  {
    num: '05',
    track: 'ミスティ・ミスティ',
    mp3: '05 ミスティ・ミスティ.mp3'
  },
  {
    num: '06',
    track: '空の扉（健全な案内）',
    mp3: '06 空の扉（健全な案内）.mp3'
  },
  {
    num: '07',
    track: '気持ちの問題',
    mp3: '07 気持ちの問題.mp3'
  },
  {
    num: '08',
    track: 'マリンスノー富津館山〜Memories of Bucky Kimura〜',
    mp3: '08 マリンスノー富津館山〜Memories of Bucky Kimura〜.mp3'
  },
  {
    num: '09',
    track: '就寝前',
    mp3: '09 就寝前.mp3'
  },
]

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def cycle
    @_cycle ||= reset_cycle
    @_cycle = [@_cycle.pop] + @_cycle
    @_cycle.first
  end

  def reset_cycle
    @_cycle = ["img/burger1.png","img/eggsaladsandwich.png","img/jellyburger.png","img/sloppyjoe.png"]
  end

  DATAFRUITS_FEATURED_WINDOW_DAYS = 180

  # data/releases.yml rows carry only raw sheet fields (see bin/fetch_releases.rb).
  # Everything derived from "now" (catalog sort order, the NEW badge, search text)
  # is computed here so it reflects the current build date, not the export date.
  def normalized_releases
    @normalized_releases ||= data.releases.to_a.each_with_index
      .map { |row, index| normalize_release(row, index) }
      .sort_by { |release| [-release[:catalog_number], -release[:index]] }
  end

  def normalize_release(row, index)
    catalog = row["catalog"].to_s
    artist = row["artist"].to_s
    title = row["title"].to_s
    release_date = row["release_date"].to_s
    tags = Array(row["tags"])

    {
      id: "#{catalog}-#{index}",
      index: index,
      catalog: catalog,
      catalog_number: catalog[/\d+/].to_i,
      artist: artist,
      artist_key: normalize_lookup_value(artist),
      title: title,
      release_date: release_date,
      cover: row["cover"].to_s,
      url: row["url"].to_s,
      series: row["series"].to_s,
      format: row["format"].to_s,
      tags: tags,
      description: row["description"].to_s,
      featured: featured_release?(release_date),
      search_text: [catalog, artist, title, release_date, row["series"], row["format"],
                    row["description"], row["tracklist"], row["credit"], *tags].join(" ").downcase,
    }
  end

  def normalized_artists
    entries = []
    seen = {}

    Array(data.artists).each do |artist|
      key = normalize_lookup_value(artist)
      next if key.empty? || key == "sorted artist" || seen[key]
      seen[key] = true
      entries << { key: key, label: artist_label(artist) }
    end

    if entries.empty?
      normalized_releases.each do |release|
        key = release[:artist_key]
        next if key.empty? || seen[key]
        seen[key] = true
        entries << { key: key, label: release[:artist] }
      end
    end

    various_index = entries.index { |entry| entry[:key] == "various artists" }
    if various_index && various_index > 0
      entries.unshift(entries.delete_at(various_index))
    end

    entries
  end

  def artist_label(artist)
    normalize_lookup_value(artist) == "various artists" ? "Various Artists" : artist
  end

  def normalize_lookup_value(value)
    value.to_s.unicode_normalize(:nfkc).strip.gsub(/\s+/, " ").downcase
  end

  def parse_release_date(value)
    match = value.to_s.strip.match(/\A(\d{4})[-\/](\d{1,2})[-\/](\d{1,2})/)
    return nil unless match

    Date.new(match[1].to_i, match[2].to_i, match[3].to_i)
  rescue ArgumentError
    nil
  end

  def featured_release?(release_date, days = DATAFRUITS_FEATURED_WINDOW_DAYS)
    date = parse_release_date(release_date)
    return false unless date

    (Date.today - days..Date.today).cover?(date)
  end

  def escape_html(value)
    value.to_s
      .gsub("&", "&amp;")
      .gsub("<", "&lt;")
      .gsub(">", "&gt;")
      .gsub('"', "&quot;")
      .gsub("'", "&#039;")
  end

  def release_cover_hue(release)
    (release[:catalog].to_s + release[:title].to_s).each_char.sum(&:ord) % 360
  end

  def release_cover_markup(release)
    label = escape_html(release[:catalog])
    fallback = %(<div class="cover-fallback" style="--cover-hue: #{release_cover_hue(release)}"><span>#{label}</span></div>)
    return fallback if release[:cover].to_s.empty?

    %(<img src="#{escape_html(release[:cover])}" alt="#{escape_html("#{release[:title]} jacket")}" loading="lazy" decoding="async" onerror="this.remove();">#{fallback})
  end

  def render_tag_list(tags)
    return "" if tags.nil? || tags.empty?

    items = tags.map { |tag| "<li>#{escape_html(tag)}</li>" }.join
    %(<ul class="tag-list" aria-label="tags">#{items}</ul>)
  end

  def render_release_card(release)
    cover = %(<div class="cover-wrap">#{release_cover_markup(release)}</div>)
    cover_node = if release[:url].to_s.empty?
      %(<div class="cover-static">#{cover}</div>)
    else
      %(<a class="cover-link" href="#{escape_html(release[:url])}" target="_blank" rel="noopener noreferrer" aria-label="Open #{escape_html(release[:title])} in a new tab" title="Open release in a new tab">#{cover}</a>)
    end
    new_mark = release[:featured] ? '<img class="new-mark" src="/img/new.gif" alt="NEW" width="76" height="32">' : ""
    date = release[:release_date].to_s.empty? ? '<span aria-hidden="true">&nbsp;</span>' : "<span>#{escape_html(release[:release_date])}</span>"
    format = release[:format].to_s.empty? ? "" : "<span>#{escape_html(release[:format])}</span>"
    detail = [date, format].reject { |item| item.strip.empty? }.join(" / ")
    description = release[:description].to_s.empty? ? "" : %(<p class="release-detail">#{escape_html(release[:description])}</p>)
    series_pill = release[:series].to_s.empty? ? "" : %(<span class="pill">#{escape_html(release[:series])}</span>)

    <<~HTML
      <article class="release-card">
        #{cover_node}
        <div class="release-body">
          <div class="meta-line">
            <span class="catalog-code">#{escape_html(release[:catalog])}</span>
            #{series_pill}
            #{new_mark}
          </div>
          <h2>#{escape_html(release[:title])}</h2>
          <p class="release-artist">#{escape_html(release[:artist])}</p>
          <p class="release-detail">#{detail}</p>
          #{description}
          #{render_tag_list(release[:tags])}
        </div>
      </article>
    HTML
  end

  def releases_payload
    normalized_releases.map do |release|
      {
        id: release[:id],
        index: release[:index],
        catalog: release[:catalog],
        catalogNumber: release[:catalog_number],
        artist: release[:artist],
        artistKey: release[:artist_key],
        title: release[:title],
        releaseDate: release[:release_date],
        cover: release[:cover],
        url: release[:url],
        series: release[:series],
        format: release[:format],
        tags: release[:tags],
        description: release[:description],
        featured: release[:featured],
        searchText: release[:search_text],
      }
    end
  end

  def artists_payload
    normalized_artists
  end

  def release_data_json
    escape_json_for_html(releases: releases_payload, artists: artists_payload)
  end

  def release_item_list_json(releases)
    payload = {
      "@context" => "https://schema.org",
      "@type" => "ItemList",
      "name" => "DATAFRUITS RELEASES catalog",
      "itemListElement" => releases.each_with_index.map do |release, position|
        {
          "@type" => "ListItem",
          "position" => position + 1,
          "item" => {
            "@type" => "MusicAlbum",
            "name" => release[:title],
            "byArtist" => { "@type" => "MusicGroup", "name" => release[:artist] },
            "datePublished" => parse_release_date(release[:release_date])&.strftime("%Y-%m-%d"),
            "identifier" => release[:catalog],
            "image" => release[:cover].to_s.empty? ? nil : release[:cover],
            "url" => release[:url].to_s.empty? ? "https://releases.datafruits.fm/##{escape_html(release[:catalog])}" : release[:url],
          }.compact,
        }
      end,
    }
    escape_json_for_html(payload)
  end

  def escape_json_for_html(value)
    JSON.generate(value).gsub("<", '\\u003c')
  end
end

set :css_dir, 'css'

# The df0xx legacy release pages mostly don't vendor their own copy of
# Bourbon/Neat and instead `@import 'bourbon/bourbon'` expecting the shared
# copy at source/css/bourbon to be on the Sass load path.
set :sass_assets_paths, [File.join(root, "source", "css")]

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

set :build_dir, "build"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
