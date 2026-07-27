# DATAFRUITS RELEASES catalog site

Middleman static site for `https://releases.datafruits.fm/`. The release catalog (search, series/artist filters, grid/list view, lazy-loading cards) is baked into `build/index.html` at build time from a YAML snapshot of the DATAFRUITS releases spreadsheet.

## Run locally

```sh
bundle install
bundle exec middleman build
```

The generated site is written to `build/`.

Local preview server (rebuilds and serves with live reload):

```sh
bundle exec middleman server
```

Open `http://127.0.0.1:4567/`.

`config.ru`/`Procfile` run the same `bundle exec middleman build` and serve `build/` via Rack for the Heroku deploy.

## Data flow

```
Google Sheet (TSV export)
  -> ruby bin/fetch_releases.rb -> data/releases.yml, data/artists.yml (committed)
  -> bundle exec middleman build -> build/index.html (release cards + embedded JSON baked in)
```

`data/releases.yml` and `data/artists.yml` are committed snapshots of the spreadsheet, not fetched live. To pick up new releases:

```sh
ruby bin/fetch_releases.rb
bundle exec middleman build
git add data/releases.yml data/artists.yml
git commit -m "Refresh release catalog"
```

`bin/fetch_releases.rb` reads the same two sheets referenced below and can be pointed at different sheets via `DATAFRUITS_TSV_URL`/`DATAFRUITS_ARTISTS_URL` env vars.

The `source/index.html.erb` template (via helpers in `config.rb`) computes everything date-dependent — sort order, search text, and the "NEW" badge for releases within the last 180 days — at build time, so a rebuild is all that's needed to refresh those, even without re-running the fetch script. It also embeds the normalized release/artist data as JSON for `source/app.js`, which handles search, filtering, view toggling, and lazy-rendering entirely client-side with no network requests.

## Deploys

Four targets all build the same way (`bundle exec middleman build`, no Node involved):

- **Heroku** — `config.ru`/`Procfile`, Rack serving `build/`.
- **Netlify** — `netlify.toml`.
- **GitLab Pages** — `.gitlab-ci.yml`, copies `build/` into `public/`.
- **GitHub Pages** — `.github/workflows/deploy-ssg.yml`, runs on push to `main`, daily on a schedule, or manually.

The custom domain (`releases.datafruits.fm`) is set via `source/CNAME`, which Middleman copies into `build/CNAME` on every build.

## Spreadsheet feed

Releases sheet: `gid=0`. Artist-list sheet: `gid=459498689` (range `B:B`), whose first row named `Sorted Artist` is skipped; `Various Artists` is pinned to the top of the artist filter, followed by a separator, then the rest.

Recommended columns:

```text
catalog ID	artist	title	link	image URL	date	Series	Package	Track List	Credit
```

Column aliases are accepted for common names such as `catalog`, `cover`, `artwork`, `jacket`, `image`, `url`, `bandcamp`, `format`, `genre`, `genres`, `released`, and Japanese labels like `品番`, `アーティスト`, `タイトル`, `発売日`, `ジャケット` (see `HEADER_ALIASES` in `bin/fetch_releases.rb`).

`image URL` should be a public image URL or a relative image path. If it is blank or fails to load, the site renders a generated catalog jacket.

The masthead also uses a small decorative layer of GIFs from DATAFRUITS wiki pages. Their positions are randomized on each load and move lightly on scroll for a parallax feel.
