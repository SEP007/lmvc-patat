#!/bin/bash

if [[ "$1" = "no-chmod" ]]
   then
      SET_CHMOD=false
   else
      SET_CHMOD=true
fi

echo "# Bootstrapping your project..."

echo "1.) Updating submodules if existent..."
git submodule sync --quiet || exit $?
git submodule update --init || exit $?
git submodule foreach --recursive --quiet "git submodule sync --quiet && git submodule update --init" || exit $?

echo "2.) Fetching dependencies…"

echo "2.1.) Composer from composer.json..."
php composer.phar install --dev

if [ "$SET_CHMOD" == true ]
   then
      echo "3.) Setting chmods for caching directories..."
      chmod 0777 app/coffeescript/_cache
      chmod 0777 app/javascripts/_cache
      chmod 0777 app/img/_cache
      chmod 0777 app/styles/_cache
      chmod 0777 app/fonts/_cache
      chmod 0777 app/markdown/_cache
      chmod 0777 app/logs
else
      echo "3.) NOT setting any chmods for caching directories..."
fi

echo "# Done: Bootstrap all good!"