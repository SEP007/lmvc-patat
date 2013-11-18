echo "2.1.) Running composer from composer.json..."

php composer.phar install --dev

echo "2.2.) Setting it up to use forks..."

echo "2.2.1.) Setting lmvc module's composer origin to fork..."

cd composer/scandio/lmvc-modules

git remote set-url composer git://github.com/SEP007/lmvc-modules.git
git remote set-url origin git://github.com/SEP007/lmvc-modules.git

git pull origin master

cd ..

echo "2.2.2.) Setting lmvc's composer origin to fork..."

cd lmvc

git remote set-url composer git://github.com/SEP007/lmvc.git
git remote set-url origin git://github.com/SEP007/lmvc.git

git pull origin master

cd ..

echo "2.2.3.) Setting troba's composer origin to fork..."

cd troba

git remote set-url composer git://github.com/SEP007/lmvc-troba.git
git remote set-url origin git://github.com/SEP007/lmvc-troba.git

git pull origin master

cd ..
cd ..
cd ..