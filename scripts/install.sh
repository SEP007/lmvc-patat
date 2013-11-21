#!/bin/bash

repo="https://github.com/SEP007/lmvc-patat.git";

if [[ "$1" != "" ]]
   then
      clone_directory=$1
   else
      clone_directory="lmvc-patat"
fi

echo "# Installing your project..."

echo "1.) Cloning the repo..."
git clone $repo $clone_directory
cd $clone_directory;

echo "2.) Copying sample config files' contents..."

echo "2.1) .sample-htaccess to .htaccess..."
cp .sample-htaccess .htaccess

echo "2.2) sample-config.json to config.json..."
cp sample-config.json config.json

echo "2.3) sample-config.js to config.js..."
cp app/javascripts/sample-config.js app/javascripts/config.js

echo "3.) Calling bootstrap.sh..."
sh scripts/bootstrap.sh

echo "# Done: Setup the rest!"