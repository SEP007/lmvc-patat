<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use \models;

class Favorites extends AnonymousController
{
    public static function index()
    {
        $CustomerModel = new \models\Customers();
        $custId        = $CustomerModel->getByUserId(Security::get()->currentUser()->id)->id;

        $dishesModel = new \models\Dishes();

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

    public static function favoriteDish($dishid)
    {
        $CustomerModel = new \models\Customers();
        $userid = Security::get()->currentUser()->id;
        $custid = $CustomerModel->getByUserId($userid)->id;

        $dishModel     = new \models\Dishes();
        $favDishes = $dishModel->getFavoriteDishesForCustomer($custid);

        foreach ($favDishes as $dish)
        {
            if ($dish->id == $dishid)
            {
                static::removeFavoriteDish($dishid);
                exit;
            }
        }
        static::addFavoriteDish($dishid);
    }

    public static function addFavoriteDish($dishid)
    {
        $CustFavDishes = new \models\CustFavDishes();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavDishes->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavDishes->dish_id = $dishid;
        $CustFavDishes->insert();

        return static::renderJson([
            'result' => true
        ]);

    }

    public static function removeFavoriteDish($dishid)
    {
        $CustFavDishes = new \models\CustFavDishes();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavDishes->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavDishes->dish_id = $dishid;
        $CustFavDishes->delete();

        return static::renderJson([
            'result' => true
        ]);

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