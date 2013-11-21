action=$1;

if [[ $action = "clear" ]]; then

   if [[ "$2" != "" ]]
      then
         CACHE_PREFIX=$2
      else
         CACHE_PREFIX="app"
   fi

   echo "# Flushing all project's caches ($CACHE_PREFIX)"

   rm -rf $CACHE_PREFIX/coffeescript/_cache/*
   echo "1.) Flushed coffeescript cache"

   rm -rf $CACHE_PREFIX/javascripts/_cache/*
   echo "2.) Flushed javascript cache"

   rm -rf $CACHE_PREFIX/img/_cache/*
   echo "2.) Flushed image cache"

   rm -rf $CACHE_PREFIX/styles/_cache/*
   echo "3.) Flushed styles cache"

   rm -rf $CACHE_PREFIX/fonts/_cache/*
   echo "4.) Flushed fonts cache"

   rm -rf $CACHE_PREFIX/markdown/_cache/*
   echo "5.) Flushed markdown cache"
else
   echo "Command '$action' unknown.";
fi