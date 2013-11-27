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

sh scripts/composer.sh

if [ "$SET_CHMOD" == true ]
   then
      sh scripts/permissions.sh
else
      echo "3.) NOT setting any chmods for caching directories..."
fi

echo "# Done: Bootstrap all good!"