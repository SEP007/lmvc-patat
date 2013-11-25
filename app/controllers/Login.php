<?php

namespace controllers;

use Scandio\lmvc\modules\security\SecureController;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\modules\rendering\traits;

class Login extends SecureController
{
    use traits\RendererController;

	/**
	 * After succesfull login, redirects to favorites or menu view depending on whether the logged in user is a customer or restaurant
	 */
    public static function index()
    {
        if (Security::get()->currentUser()->isInGroup("Customer")) {
			return static::redirect('Favorites::index');	
		} else if (Security::get()->currentUser()->isInGroup("Restaurant")) {
			return static::redirect('Menu::index');
		} else {
			return static::redirect('Application::index');
		}
    }
}