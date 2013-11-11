<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;

class Favorites extends AnonymousController
{
    public static function index()
    {
        return static::render();
    }
}