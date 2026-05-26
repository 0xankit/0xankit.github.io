# 0xankit | Ankit Kumar

Personal website and technical blog powered by Jekyll using the Chirpy theme.

## Local development

Prerequisites:

- Ruby 3.3.x and Bundler installed

Notes:

- This repository pins the Ruby runtime in `.ruby-version` and the GitHub Actions workflow uses the same value.
- On macOS with Homebrew (if `ruby@3.3` is installed but not linked), run commands with:

```bash
export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"
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

GitHub Pages deployment is handled by GitHub Actions workflow in `.github/workflows/pages-deploy.yml`.

After migrating from Hugo to Chirpy's GitHub Actions artifact deployment flow, set:

- **Repository Settings → Pages → Build and deployment → Source = `GitHub Actions`**

If Pages is still configured to deploy from the `gh-pages` branch, `actions/deploy-pages` fails with:
`Invalid deployment branch ... Deployments are only allowed from gh-pages`.
