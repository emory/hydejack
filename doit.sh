#!/bin/bash

echo "bundle install time"
bundle install
echo "build the site using bundle exec jekyll"
bundle exec jekyll build
echo "make sure our permissions are sane-ish"
find _site -type f -exec chmod -R ugo+r {}\;
find _site -type d -exec chmod ugo+rx {} \;
echo "put them in the document root for apache"
rsync -azvP _site/ /var/www/html/
