source "https://rubygems.org"

# Pin the GitHub Pages gem so local `bundle exec jekyll serve` matches the
# exact Jekyll + plugin versions GitHub Pages builds with. Prevents local
# preview from diverging from production. Update with `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins

# Plugins declared in _config.yml (jekyll-sitemap, jekyll-feed) ship with github-pages.

# Weekly heavy-layer link/HTML check (scripts/release.sh) — not run on every push.
group :development do
  gem "html-proofer"
end
