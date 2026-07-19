source "https://rubygems.org"

# Pin the GitHub Pages gem so local `bundle exec jekyll serve` matches the
# exact Jekyll + plugin versions GitHub Pages builds with. Prevents local
# preview from diverging from production. Update with `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins

# Plugins declared in _config.yml (jekyll-sitemap, jekyll-feed) ship with github-pages.

# github-pages pins Jekyll 3.9.0, which requires stdlib gems no longer bundled
# by default since Ruby 3.4 (extracted to independent gems). Without this,
# `bundle exec jekyll build` fails with "cannot load such file -- csv" on any
# Ruby >= 3.4 — this repo had no local Jekyll tooling running at all before.
gem "csv"

# Weekly heavy-layer link/HTML check (scripts/release.sh) — not run on every push.
group :development do
  gem "html-proofer"
end
