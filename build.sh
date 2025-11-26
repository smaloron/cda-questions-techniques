#!/bin/sh

mkdir docs

unzip webHelp*.zip -d docs

# git subtree push --prefix docs origin gh-pages