#!/bin/bash
set -e

nanoc prune --yes
nanoc compile
cd output
git add -A
git commit -am "Site updated"
git push
