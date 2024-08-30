#!/usr/bin/env -S just --justfile
# just reference  : https://just.systems/man/en/

set quiet := true

alias default := build

copy:
    mise run --timings copy
    mise run --timings p2j

# Build the document
build: && clean
    -mise run --timings copy  # It's okay if this fails
    mise run --timings build

# Clean up build files
[private]
clean:
    # Continue on error
    -rm agujournaltemplate.aux
    -rm agujournaltemplate.blg
    -rm agujournaltemplate.fdb_latexmk
    # -rm agujournaltemplate.fls
    -rm agujournaltemplate.log

# Install the tectonic-typesetting binary
install:
    curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh 

compile:
    tectonic -Z shell-escape --keep-intermediates agujournaltemplate.tex

diff:
    mise run --timings diff:create
    # mise run --timings diff:compile
