#!/bin/bash

if [[ "$1" = "dev" ]]
   then
      dev="--dev"
   else
      dev=""
fi

echo "# Updating your project..."

echo "1.) Updating submodules if existent…"
git submodule sync --quiet || exit $?
git submodule update --init || exit $?
git submodule foreach --recursive --quiet "git submodule sync --quiet && git submodule update --init" || exit $?

echo "2.) Updating dependencies…"

echo "2.1.) Composer from composer.json..."
php composer.phar update $dev

echo "# Done: Code on!"