<?php

namespace controllers;

use Scandio\lmvc;
use Scandio\lmvc\Controller;
use Scandio\lmvc\modules\security\controllers;
use \models;
use \forms;
use \util;
use Scandio\lmvc\utils\config\Config;

class Security extends controllers\Security
{
    protected static function authenticate()
    {
        # Lets call mummy, the parent first
        $parentResponse = parent::authenticate();

        # Checks if login is actually cool with module's controller
        if ($parentResponse['success'] === true) {
            # ... if so, we can get the users model
            $user = \models\Users::findBy('username', static::request()->username)->one();

            # ... check if he's verified
            if ($user->verified == 1) {
                # return what was initially returned by parent anyways (will redirect)
                return $parentResponse;
            } else {
                # Otherwise we need to redfine the response to a false one again
                return [
                    'success' => false,
                    'controllerAction' => 'Security::login',
                    'params' => ['failure']
                ];
            }
        # .. and if stuff went wrong in the first place, then redirect there
        } else {
            return $parentResponse;
        }
    }
}