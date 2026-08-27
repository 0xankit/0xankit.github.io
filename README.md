# 0xankit | Ankit Kumar

Personal website and technical blog powered by Jekyll using the Chirpy theme.

## Local development

Install dependencies.

On macOS with Homebrew:

```bash
brew install ruby@3.3
brew install --cask mactex
```

On Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install ruby-full bundler texlive-xetex texlive-fonts-recommended texlive-fonts-extra
```

Prerequisites:

- Ruby 3.3.x and Bundler installed
- XeLaTeX installed (`xelatex --version`)

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

### Test locally

Build and validate the Jekyll site:

```bash
bash tools/test.sh
```

Build all LaTeX documents:

```bash
cd src
for document in resume cv coverletter; do
	xelatex -interaction=nonstopmode -halt-on-error -file-line-error "$document.tex"
done
cd ..
```

### Build the LaTeX documents

Install a full TeX distribution with XeLaTeX. On macOS, [MacTeX](https://www.tug.org/mactex/) is recommended. Build the resume, CV, and cover letter from the `src/` directory:

```bash
cd src
xelatex -interaction=nonstopmode -halt-on-error resume.tex
xelatex -interaction=nonstopmode -halt-on-error cv.tex
xelatex -interaction=nonstopmode -halt-on-error coverletter.tex
```

This creates `src/resume.pdf`, `src/cv.pdf`, and `src/coverletter.pdf`. The same documents are compiled and published as PDF assets by the `LaTeX documents` GitHub Actions workflow whenever relevant files under `src/` change. You can also start it manually from the Actions tab.

## Project structure

- `_posts/`: Blog posts
- `_tabs/`: Top-level pages (About, Projects, Experience, etc.)
- `assets/img/`: Images used by posts and profile
- `files/`: Downloadable files (resume)
- `src/`: LaTeX sources, fonts, and generated resume documents

## Deployment

GitHub Pages deployment is handled by GitHub Actions workflow in `.github/workflows/pages-deploy.yml`.

After migrating from Hugo to Chirpy's GitHub Actions artifact deployment flow, set:

- **Repository Settings → Pages → Build and deployment → Source = `GitHub Actions`**

If Pages is still configured to deploy from the `gh-pages` branch, `actions/deploy-pages` fails with:
`Invalid deployment branch ... Deployments are only allowed from gh-pages`.
