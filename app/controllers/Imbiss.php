<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\LVC;

class Imbiss extends AnonymousController
{
    public static function index($handle = null)
    {
        if ($handle == null) { return static::redirect('Application::index'); }

        $dishesModel = new \models\Dishes();
        $usersModel = new \models\Users();
        $sessionUser = Security::get()->currentUser();
        $customersModel = new \models\Customers();

        return static::render([
            'advertisedDishes'          =>  $dishesModel->getDishesByRestaurant($handle, false, true),
            'unadvertisedDishes'        =>  $dishesModel->getDishesByRestaurant($handle, false),
            'restaurant'                =>  $usersModel->getByHandle($handle),
            'loggedInCustomer'                      =>  $customersModel->getCustomerByUsername($sessionUser->username)
        ]);
    }
}