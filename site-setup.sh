#!/usr/bin/env bash

# this script records the actions which were done to setup the github pages
# site with "git subtree"
#
# the basic idea of the site setup is as follows:
#
#   - github.com/gillsignals/amygill.net is the git repo for the site
#   - in that repo, GitHub pages is configured to serve the site from the "master" branch
#   - the default branch for actually using this repo therefore *can't be master*
#   - instead, we set the default branch to a branch named "source"
#   - master was recreated as an empty branch
#   - we use git-subtree to setup:
#     - in "source", the "public" folder is mapped to the root of "master"
#     - we add a site-deploy.sh script for automating the git-subtree push methods
#


# first, remove the "public" directory and all of its contents
rm -r ./public
git add ./public
git commit -m "remove the public dir"

# create the subtree mapping, use "--squash" to blow away the commit history
# from the current branch (which is usually what you want to do)
git subtree add --prefix public/ origin master --squash

# update from "origin/master" into our subtree
git subtree pull --prefix public/ origin master --squash

# remove ./public again! because we want the directory to be clean
rm -r ./public

echo "setup almost done! Now you need to build the site and then run site-deploy.sh"
