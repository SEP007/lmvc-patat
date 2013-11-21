<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;

class Application extends AnonymousController
{
    public static function index()
    {
        Logger::instance()->info('The Patat {what}!', ['what' => 'started']);
        return static::render();
    }
}