#!/usr/bin/env bash

#
# deploy changes to the site to GitHub pages!
# meant to run after a fresh build of the site has been built and committed
#

git subtree push --prefix public/ origin master
