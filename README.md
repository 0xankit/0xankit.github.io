# 0xankit | Ankit Kumar

Personal website and technical blog powered by Jekyll using the Chirpy theme.

## Local development

Prerequisites:

- Ruby 3.1.x and Bundler installed

Notes:

- `jekyll-theme-chirpy` in this repository requires Ruby `~> 3.1`.
- On macOS with Homebrew (if `ruby@3.1` is installed but not linked), run commands with:

```bash
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH" && bash tools/run.sh -H 127.0.0.**1**
```

Commands:

```bash
bundle install
bundle exec jekyll serve
```

Then open http://127.0.0.1:4000.

## Project structure

- `_posts/`: Blog posts
- `_tabs/`: Top-level pages (About, Projects, Experience, etc.)
- `assets/img/`: Images used by posts and profile
- `files/`: Downloadable files (resume)

## Deployment

GitHub Pages deployment is handled by GitHub Actions workflow in `.github/workflows/pages-deploy.yml` and runs on pushes to `master`.
