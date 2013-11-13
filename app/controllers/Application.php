<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;

class Application extends AnonymousController
{
    public static function index()
    {
        Logger::instance()->warning('The Patat {what}!', ['what' => 'started']);
        Logger::instance()->info('The Server: {server}!', ['server' => $_SERVER]);
        Logger::instance()->error('Kostas you {what}!', ['what' => 'broke it!']);

        return static::render();
    }
}