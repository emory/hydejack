#!/bin/bash

echo "bundle install time"
bundle install
echo "build the site using bundle exec jekyll"
bundle exec jekyll build
echo "put them in the document root for apache"
rsync -azvP --delete _site/ /var/www/html/
echo "make sure our permissions are sane-ish"
find /var/www/html -type f -exec chmod -R ugo+r {}\;
find /var/www/html -type d -exec chmod ugo+rx {} \;
