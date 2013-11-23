<?php
error_reporting(E_ALL ^ E_NOTICE);
setlocale(LC_ALL, "de_DE");
date_default_timezone_set('Europe/Berlin');

require_once('./composer/autoload.php');

use Scandio\lmvc\LVC;

LVC::initialize('config.json');

LVC::dispatch();
