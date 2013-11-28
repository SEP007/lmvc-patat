<?php

namespace controllers;

use Scandio\lmvc;
use Scandio\lmvc\Controller;
use Scandio\lmvc\modules\session\Session;
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
    protected static function authenticate($writeSession = true)
    {
        #Call the parent function first
        $parentResponse = parent::authenticate(false);

        if ($parentResponse['success'] === true) {
            $user = \models\Users::findBy('username', static::request()->username) -> one();

            if ($user->verified == 1){
                Session::set('security.current_user', static::request()->username);
                Session::set('security.authenticated', true);
				
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