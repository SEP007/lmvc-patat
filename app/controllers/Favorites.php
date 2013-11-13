<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\utils\logger\Logger;
use Scandio\lmvc\LVC;
use Scandio\lmvc\modules\security\Security;
use \models;
use Scandio\lmvc\modules\session\Session;

class Favorites extends AnonymousController
{
    public static function index()
    {
        #return static::render();
        static::dishes();
    }

    public static function dishes()
    {
        $CustomerModel = new \models\Customers();
        $custId        = $CustomerModel->getByUserId(Security::get()->currentUser()->id)->id;

        $dishesModel = new \models\Dishes();

        #self::setRenderArg('dishesGrouped', $dishesModel->
        #    getDishesWithinDistance(Session::get("location.longitude"), Session::get("location.latitude"), 25, true));

        self::setRenderArg('dishes', $dishesModel->
            getFavoriteDishesForCustomer($custId));


        self::render();
    }

    public static function locations()
    {
        $CustomerModel = new \models\Customers();
        $custId        = $CustomerModel->getByUserId(Security::get()->currentUser()->id)->id;

        $locationModel = new \models\Locations();

        self::setRenderArg('locations', $locationModel->
            getFavoritePlacesForCustomer($custId));
        self::render();
    }

    public static function addFavoriteDish($dishid)
    {
        $CustFavDishes = new \models\CustFavDishes();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavDishes->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavDishes->dish_id = $dishid;
        $CustFavDishes->insert();

        return static::render();

    }

    public static function addFavoriteLocation($locationid)
    {
        $CustFavLocation = new \models\CustFavLocation();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavLocation->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavLocation->loc_id = $locationid;
        $CustFavLocation->insert();

        return static::render();

    }
}