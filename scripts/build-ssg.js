const fs = require("node:fs/promises");
const path = require("node:path");

const { renderIndex } = require("../server");

const ROOT = path.join(__dirname, "..");
const OUTPUT_DIR = path.resolve(ROOT, process.env.OUTPUT_DIR || "dist");
const PUBLIC_ORIGIN = process.env.PUBLIC_ORIGIN || "https://releases.datafruits.fm";
const PAGES_CNAME = process.env.PAGES_CNAME || "releases.datafruits.fm";
const PRESERVE_OUTPUT = process.env.PRESERVE_OUTPUT === "1";

async function copyPath(source, destination) {
  const stats = await fs.stat(source);
  if (stats.isDirectory()) {
    await fs.mkdir(destination, { recursive: true });
    const entries = await fs.readdir(source);
    await Promise.all(entries.map((entry) => copyPath(path.join(source, entry), path.join(destination, entry))));
    return;
  }

  await fs.mkdir(path.dirname(destination), { recursive: true });
  await fs.copyFile(source, destination);
}

async function build() {
  if (!PRESERVE_OUTPUT) {
    await fs.rm(OUTPUT_DIR, { force: true, recursive: true });
  }
  await fs.mkdir(OUTPUT_DIR, { recursive: true });

  const html = await renderIndex(new URL("/", PUBLIC_ORIGIN));
  await fs.writeFile(path.join(OUTPUT_DIR, "index.html"), html);

  await Promise.all([
    copyPath(path.join(ROOT, "app.js"), path.join(OUTPUT_DIR, "app.js")),
    copyPath(path.join(ROOT, "styles.css"), path.join(OUTPUT_DIR, "styles.css")),
    copyPath(path.join(ROOT, "img"), path.join(OUTPUT_DIR, "img")),
    copyPath(path.join(ROOT, "data"), path.join(OUTPUT_DIR, "data")),
    fs.writeFile(path.join(OUTPUT_DIR, ".nojekyll"), ""),
    fs.writeFile(path.join(OUTPUT_DIR, "CNAME"), `${PAGES_CNAME}\n`),
  ]);

  console.log(`SSG build complete: ${path.relative(ROOT, OUTPUT_DIR)}/index.html`);
}

build().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
