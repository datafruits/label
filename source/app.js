const INITIAL_RENDER_COUNT = 36;
const RENDER_CHUNK_SIZE = 24;
const WIKI_GIF_BASE_URL = "https://datafruits.fm/assets/images/emojis/";
const WIKI_GIF_SOURCES = [
  "grumby.gif",
  "grumby_spin.gif",
  "alligottadoisfindthemustard.gif",
  "lemoner.gif",
  "greasyhotdogs.gif",
  "strawbur.gif",
  "orangey.gif",
  "banaynay.gif",
  "watermel.gif",
  "cabbage.gif",
  "datafruits.gif",
  "jambox.gif",
  "viz.gif",
  "garf.gif",
  "thisisamazing.gif",
].map((fileName) => `${WIKI_GIF_BASE_URL}${fileName}`);
const WIKI_GIF_COUNT = 12;
const WIKI_GIF_ZONES = [
  { x: [-2, 14], y: [8, 78] },
  { x: [84, 98], y: [8, 78] },
  { x: [18, 76], y: [2, 20] },
  { x: [3, 38], y: [72, 90] },
  { x: [56, 94], y: [70, 90] },
];

const elements = {
  wikiGifDecorations: document.querySelector("#wikiGifDecorations"),
  toolbar: document.querySelector("#releaseToolbar"),
  searchInput: document.querySelector("#searchInput"),
  seriesFilter: document.querySelector("#seriesFilter"),
  artistFilter: document.querySelector("#artistFilter"),
  gridViewButton: document.querySelector("#gridViewButton"),
  listViewButton: document.querySelector("#listViewButton"),
  releaseGrid: document.querySelector("#releaseGrid"),
  loadSentinel: document.querySelector("#loadSentinel"),
  resultsMeta: document.querySelector("#resultsMeta"),
  emptyTemplate: document.querySelector("#emptyTemplate"),
};

const state = {
  releases: [],
  artists: [],
  query: "",
  series: "all",
  artist: "all",
  view: window.localStorage.getItem("datafruits:view") || "grid",
  renderLimit: INITIAL_RENDER_COUNT,
};

let renderHandle;
let loadObserver;
let wikiGifFrame;

function escapeHtml(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function scheduleRender() {
  if (renderHandle) return;
  renderHandle = window.requestAnimationFrame(() => {
    renderHandle = undefined;
    render();
  });
}

function setView(view) {
  state.view = view;
  window.localStorage.setItem("datafruits:view", view);
  elements.gridViewButton.setAttribute("aria-pressed", String(view === "grid"));
  elements.listViewButton.setAttribute("aria-pressed", String(view === "list"));
  elements.releaseGrid.classList.toggle("is-list", view === "list");
}

function getFilteredReleases() {
  const query = state.query.trim().toLowerCase();
  const filtered = state.releases.filter((release) => {
    const matchesQuery = !query || release.searchText.includes(query);
    const matchesSeries = state.series === "all" || release.series === state.series;
    const matchesArtist = state.artist === "all" || release.artistKey === state.artist;
    return matchesQuery && matchesSeries && matchesArtist;
  });

  return filtered.sort((a, b) => b.catalogNumber - a.catalogNumber || b.index - a.index);
}

function getCoverHue(release) {
  let total = 0;
  for (const char of release.catalog + release.title) {
    total += char.charCodeAt(0);
  }
  return total % 360;
}

function getCoverMarkup(release) {
  const label = escapeHtml(release.catalog);
  const fallback = `<div class="cover-fallback" style="--cover-hue: ${getCoverHue(release)}"><span>${label}</span></div>`;
  if (release.cover) {
    return `<img src="${escapeHtml(release.cover)}" alt="${escapeHtml(`${release.title} jacket`)}" loading="lazy" decoding="async" onerror="this.remove();">${fallback}`;
  }
  return fallback;
}

function renderTags(tags) {
  if (!tags.length) return "";
  const items = tags.map((tag) => `<li>${escapeHtml(tag)}</li>`).join("");
  return `<ul class="tag-list" aria-label="tags">${items}</ul>`;
}

function randomBetween(min, max) {
  return min + Math.random() * (max - min);
}

function shuffle(values) {
  return values
    .map((value) => ({ value, rank: Math.random() }))
    .sort((a, b) => a.rank - b.rank)
    .map((item) => item.value);
}

function createWikiGifLayout(index) {
  const zone = WIKI_GIF_ZONES[index % WIKI_GIF_ZONES.length];
  const depthDirection = index % 3 === 0 ? -1 : 1;
  return {
    depthX: randomBetween(-0.08, 0.08),
    depthY: randomBetween(0.12, 0.34) * depthDirection,
    left: randomBetween(zone.x[0], zone.x[1]),
    rotate: `${randomBetween(-14, 14).toFixed(2)}deg`,
    size: Math.round(randomBetween(54, 106)),
    top: randomBetween(zone.y[0], zone.y[1]),
    delay: `${randomBetween(-4.6, -0.1).toFixed(2)}s`,
  };
}

function getWikiGifStyle(layout) {
  const rules = [
    `--wiki-gif-size: ${layout.size}px`,
    `--wiki-gif-delay: ${layout.delay}`,
    `top: ${layout.top.toFixed(2)}%`,
    `left: ${layout.left.toFixed(2)}%`,
  ];
  return rules.join("; ");
}

function renderWikiGifDecorations() {
  if (!elements.wikiGifDecorations) return;
  const sources = shuffle(WIKI_GIF_SOURCES).slice(0, WIKI_GIF_COUNT);
  const sprites = sources.map((src, index) => {
    const layout = createWikiGifLayout(index);
    return `
      <span
        class="wiki-gif-sprite"
        data-depth-x="${layout.depthX.toFixed(3)}"
        data-depth-y="${layout.depthY.toFixed(3)}"
        data-rotate="${escapeHtml(layout.rotate)}"
        style="${escapeHtml(getWikiGifStyle(layout))}"
      >
        <img src="${escapeHtml(src)}" alt="" loading="lazy" decoding="async" draggable="false">
      </span>
    `;
  }).join("");
  elements.wikiGifDecorations.innerHTML = sprites;
}

function updateWikiGifParallax() {
  if (!elements.wikiGifDecorations) return;
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    elements.wikiGifDecorations.querySelectorAll(".wiki-gif-sprite").forEach((sprite) => {
      sprite.style.transform = "";
    });
    return;
  }

  const masthead = elements.wikiGifDecorations.closest(".masthead");
  const scrollY = Math.max(window.scrollY || 0, 0);
  const travel = Math.min(scrollY, (masthead?.offsetHeight || 260) + 160);
  elements.wikiGifDecorations.querySelectorAll(".wiki-gif-sprite").forEach((sprite) => {
    const depthX = Number(sprite.dataset.depthX || 0);
    const depthY = Number(sprite.dataset.depthY || 0);
    const rotate = sprite.dataset.rotate || "0deg";
    sprite.style.transform = `translate3d(${(travel * depthX).toFixed(2)}px, ${(travel * depthY).toFixed(2)}px, 0) rotate(${rotate})`;
  });
}

function scheduleWikiGifParallax() {
  if (wikiGifFrame) return;
  wikiGifFrame = window.requestAnimationFrame(() => {
    wikiGifFrame = undefined;
    updateWikiGifParallax();
  });
}

function setupWikiGifDecorations() {
  if (!elements.wikiGifDecorations) return;
  renderWikiGifDecorations();

  const motionQuery = window.matchMedia("(prefers-reduced-motion: reduce)");
  if (!motionQuery.matches) {
    updateWikiGifParallax();
    window.addEventListener("scroll", scheduleWikiGifParallax, { passive: true });
  }
  window.addEventListener("resize", scheduleWikiGifParallax);
}

function renderCard(release) {
  const cover = `<div class="cover-wrap">${getCoverMarkup(release)}</div>`;
  const coverNode = release.url
    ? `<a class="cover-link" href="${escapeHtml(release.url)}" target="_blank" rel="noopener noreferrer" aria-label="Open ${escapeHtml(release.title)} in a new tab" title="Open release in a new tab">${cover}</a>`
    : `<div class="cover-static">${cover}</div>`;
  const newMark = release.featured ? '<img class="new-mark" src="/img/new.gif" alt="NEW" width="76" height="32">' : "";
  const date = release.releaseDate ? `<span>${escapeHtml(release.releaseDate)}</span>` : '<span aria-hidden="true">&nbsp;</span>';
  const format = release.format ? `<span>${escapeHtml(release.format)}</span>` : "";
  const detail = [date, format].filter((item) => item.trim() !== "").join(" / ");
  const description = release.description ? `<p class="release-detail">${escapeHtml(release.description)}</p>` : "";
  const seriesPill = release.series ? `<span class="pill">${escapeHtml(release.series)}</span>` : "";

  return `
    <article class="release-card">
      ${coverNode}
      <div class="release-body">
        <div class="meta-line">
          <span class="catalog-code">${escapeHtml(release.catalog)}</span>
          ${seriesPill}
          ${newMark}
        </div>
        <h2>${escapeHtml(release.title)}</h2>
        <p class="release-artist">${escapeHtml(release.artist)}</p>
        <p class="release-detail">${detail}</p>
        ${description}
        ${renderTags(release.tags)}
      </div>
    </article>
  `;
}

function renderSeriesOptions() {
  const seriesList = Array.from(new Set(state.releases.map((release) => release.series).filter(Boolean))).sort();
  const previous = state.series;
  elements.seriesFilter.innerHTML = [
    '<option value="all">All series</option>',
    ...seriesList.map((series) => `<option value="${escapeHtml(series)}">${escapeHtml(series)}</option>`),
  ].join("");
  state.series = seriesList.includes(previous) ? previous : "all";
  elements.seriesFilter.value = state.series;
}

function renderArtistOptions() {
  const previous = state.artist;
  const entries = state.artists;

  const options = ['<option value="all">All artists</option>'];
  for (const [index, entry] of entries.entries()) {
    options.push(`<option value="${escapeHtml(entry.key)}">${escapeHtml(entry.label)}</option>`);
    if (index === 0 && entry.key === "various artists" && entries.length > 1) {
      options.push('<option disabled value="">────────────</option>');
    }
  }

  elements.artistFilter.innerHTML = options.join("");
  state.artist = entries.some((entry) => entry.key === previous) ? previous : "all";
  elements.artistFilter.value = state.artist;
}

function renderSummary(filtered) {
  const total = state.releases.length;
  const shown = Math.min(state.renderLimit, filtered.length);
  elements.resultsMeta.textContent = shown < filtered.length
    ? `${shown} shown / ${filtered.length} matched / ${total} loaded`
    : `${filtered.length} shown / ${total} loaded`;
}

function updateLoadSentinel(filteredLength) {
  const hasMore = state.renderLimit < filteredLength;
  elements.loadSentinel.hidden = !hasMore;
  elements.loadSentinel.textContent = hasMore
    ? `${Math.min(state.renderLimit, filteredLength)} / ${filteredLength} shown`
    : "";
}

function loadMoreReleases() {
  const filtered = getFilteredReleases();
  if (state.renderLimit >= filtered.length) return;
  state.renderLimit += RENDER_CHUNK_SIZE;
  render();
}

function resetRenderLimit() {
  state.renderLimit = INITIAL_RENDER_COUNT;
}

function render() {
  renderSeriesOptions();
  renderArtistOptions();
  const filtered = getFilteredReleases();
  renderSummary(filtered);
  elements.releaseGrid.classList.toggle("is-list", state.view === "list");

  if (!filtered.length) {
    elements.releaseGrid.innerHTML = elements.emptyTemplate.innerHTML;
    updateLoadSentinel(0);
    return;
  }

  const visible = filtered.slice(0, state.renderLimit);
  elements.releaseGrid.innerHTML = visible.map(renderCard).join("");
  updateLoadSentinel(filtered.length);
}

function setupEvents() {
  elements.searchInput.addEventListener("input", () => {
    state.query = elements.searchInput.value;
    resetRenderLimit();
    render();
  });

  elements.seriesFilter.addEventListener("change", () => {
    state.series = elements.seriesFilter.value;
    resetRenderLimit();
    render();
  });

  elements.artistFilter.addEventListener("change", () => {
    state.artist = elements.artistFilter.value;
    resetRenderLimit();
    render();
  });

  elements.gridViewButton.addEventListener("click", () => {
    setView("grid");
    render();
  });

  elements.listViewButton.addEventListener("click", () => {
    setView("list");
    render();
  });
}

function setupLazyRender() {
  if (!("IntersectionObserver" in window) || !elements.loadSentinel) return;
  loadObserver = new IntersectionObserver(
    (entries) => {
      if (entries.some((entry) => entry.isIntersecting)) {
        loadMoreReleases();
      }
    },
    { rootMargin: "720px 0px" },
  );
  loadObserver.observe(elements.loadSentinel);
}

function readEmbeddedData() {
  const node = document.querySelector("#releaseData");
  if (!node?.textContent) return { releases: [], artists: [] };

  try {
    const parsed = JSON.parse(node.textContent);
    return {
      releases: Array.isArray(parsed.releases) ? parsed.releases : [],
      artists: Array.isArray(parsed.artists) ? parsed.artists : [],
    };
  } catch {
    return { releases: [], artists: [] };
  }
}

const embedded = readEmbeddedData();
state.releases = embedded.releases;
state.artists = embedded.artists;
state.renderLimit = state.releases.length;

setupEvents();
setupLazyRender();
setupWikiGifDecorations();
setView(state.view === "list" ? "list" : "grid");
render();
