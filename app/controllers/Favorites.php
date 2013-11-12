<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;
use Scandio\lmvc\modules\security\Security;
use \models;

class Favorites extends AnonymousController
{
    public static function index()
    {
        return static::render();
    }

    public static function addFavorite($dishid)
    {
        $CustFavDishes = new \models\CustFavDishes();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavDishes->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavDishes->dish_id = $dishid;
        $CustFavDishes->insert();

        return static::render();

    }
}