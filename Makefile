SHELL := /bin/bash

LATEX ?= $(shell if command -v xelatex >/dev/null 2>&1; then command -v xelatex; elif [ -x /Library/TeX/texbin/xelatex ]; then printf '%s' /Library/TeX/texbin/xelatex; else printf '%s' xelatex; fi)
LATEX_ARGS := -interaction=nonstopmode -halt-on-error -file-line-error
LATEX_DOCUMENTS := resume cv coverletter

.PHONY: all build latex site test clean start help

all: build

build: latex site

latex:
	@set -e; for document in $(LATEX_DOCUMENTS); do \
		echo "Building src/$$document.tex"; \
		cd src && $(LATEX) $(LATEX_ARGS) "$$document.tex"; \
		cd ..; \
	done

site:
	bundle exec jekyll build

test:
	bash tools/test.sh

clean:
	rm -rf _site
	rm -f src/*.aux src/*.fdb_latexmk src/*.fls src/*.log src/*.out src/*.pdf src/*.synctex.gz *.log

start:
	bash tools/run.sh

help:
	@printf '%s\n' \
		'make build  Build the LaTeX documents and Jekyll site' \
		'make latex  Build resume.pdf, cv.pdf, and coverletter.pdf' \
		'make site   Build the Jekyll site' \
		'make test   Build and validate the Jekyll site' \
		'make clean  Remove generated site and LaTeX files' \
		'make start  Start the local Jekyll server'