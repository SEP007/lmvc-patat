#!/bin/bash

if [[ "$1" != "" ]]
   then
      directory=$1
   else
      directory="lmvc-patat"
fi

echo "3.1) Flushing caches first for a fresh start..."
sh scripts/cache.sh clear

echo "3.2) Reverting chmods for all sub directories..."
cd ..
sudo find $directory -type d -exec chmod 755 {} +
sudo find $directory -type f -exec chmod 644 {} +
cd $directory

echo "3.2) Setting chmods for caching directories..."
chmod 0777 app/coffeescript/_cache
chmod 0777 app/javascripts/_cache
chmod 0777 app/img/_cache
chmod 0777 app/styles/_cache
chmod 0777 app/fonts/_cache
chmod 0777 app/markdown/_cache
chmod 0777 app/logs