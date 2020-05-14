# --------------------------------------------------
# standard Makefile preamble
# see https://tech.davis-hansson.com/p/make/
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error Your Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >
# --------------------------------------------------

build: $(shell find src/*) Makefile
> rm -rf build
> mkdir -p build
> cd src
> pdflatex --output-directory ../build paper.tex


clean:
> rm -rf *.aux
> rm -rf *.pdf
> rm -rf *.out
> rm -rf build
.PHONY: clean
