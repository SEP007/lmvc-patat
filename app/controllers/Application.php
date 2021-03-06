<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;
use Scandio\lmvc\modules\rendering\traits;

class Application extends AnonymousController
{
    use traits\RendererController;

    public static function index()
    {
        Logger::instance()->warning('The Patat {what}!', ['what' => 'started']);

        return static::render();
    }
}