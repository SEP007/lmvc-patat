[![Build Status](https://travis-ci.org/SEP007/lmvc-patat.png)](https://travis-ci.org/SEP007/lmvc-patat)
[![Coverage Status](https://coveralls.io/repos/SEP007/lmvc-patat/badge.png)](https://coveralls.io/r/SEP007/lmvc-patat)
[![Dependency Status](https://www.versioneye.com/user/projects/5260ffb2632bac5cff0004ac/badge.png)](https://www.versioneye.com/user/projects/5260ffb2632bac5cff0004ac)

# LMVC Patat (Find a snack)

LMVC Patat is a small app built using the LMVC Framework and its modules.

A small little app suggesting fast food restaurant within walking distance to a hungry person.

## Install LMVC Patat

LMVC Patat is based upon [LMVC](https://raw.github.com/SEP007/lmvc) and more specifically [LMVC Afresh](https://github.com/scandio/lmvc-afresh).

### Download and setup work

As I expect you to be on a Unix system, all you need is one fancy command downloading a bash-file which does all the work.
If you're on Windows you need to clone, setup chmods, fetch dependencies and move sample-config file's content around yourself. It's what you deserve for it anyways ;-)

So if you're on Unix run this:
`bash -c "$(curl -fsSL http://git.io/xzIkXA)"`

Kaboom! Hope it went well...

### Setup the Database

1. Setup a new database in your own MySQL and select it
   - When you're using MAMP this is typically done on your *localhost* with *phymyadmin* as a front-end for your database
2. Import the security module's [database](https://github.com/SEP007/lmvc-modules/blob/master/lib/Scandio/lmvc/modules/security/docs/DatabasePrincipal.sql)
3. Import patat's [database](https://github.com/SEP007/lmvc-patat/blob/master/docs/lmvc-patat.sql)
4. Adjust database credentials in app's `config.js`

### Run it

Launch the app in the browser e.g. [localhost/lmvc-patat](http://localhost/lmvc-patat).

## Some screenshots

### Application on desktop
[![App index](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-1-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-1-b.jpg)
[![Restaurant list](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-2-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-2-s.jpg)
[![Single Restaurant](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-3-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-3-b.jpg)
[![Route to Restaurant](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-4-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-4-b.jpg)
[![Registration](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-5-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-5-b.jpg)
[![Manage Menu](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-6-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-6-b.jpg)
[![Edit Dish](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-7-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-7-b.jpg)

### Application on mobile (it's just bootstrap)

[![Restaurant list](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-8-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-8-b.jpg)
[![Restaurant view](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-9-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-9-b.jpg)
[![Menu](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-10-s.jpg)](https://raw.github.com/scandio/lmvc-patat/master/screens/patat-10-b.jpg)

## Further references

* [LMVC on GitHub](https://raw.github.com/scandio/lmvc)
* [LMVC Modules on GitHub](https://github.com/scandio/lmvc-modules)
* [Bower](http://bower.io/)
* [Composer](http://getcomposer.org/) and [Packagist](http://packagist.org)