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
    /**
     * Overrides lmvc's authentication function to include
     * check for email verification
     * @return array
     */
    protected static function authenticate()
    {
        #Call the parent function first
        $parentResponse = parent::authenticate();

        if ($parentResponse['success'] === true) {
            $user = \models\Users::findBy('username', static::request()->username) -> one();

            if ($user->verified == 1){
                return $parentResponse;
            } else {
                return [
                    'success' => false,
                    'controllerAction' => 'Security::login',
                    'params' => ['failure']
                ];
            }
        } else {
            return $parentResponse;
        }
    }
}