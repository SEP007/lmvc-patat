<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use \models;
use \models\Customers;
use Scandio\lmvc\modules\rendering\traits;
use Scandio\lmvc\modules\session\Session;

class Favorites extends AnonymousController
{
    use traits\RendererController;

    public static function index()
    {
        $custId        = Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $dishesModel   = new \models\Dishes();

        self::setRenderArg('dishes', $dishesModel->
            getFavoriteDishesForCustomer($custId, false));

        self::render();
    }

    public static function locations()
    {

        $custId        = Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $locationModel = new \models\Locations();

        self::setRenderArg('locations', $locationModel->
            getFavoriteLocationsForCustomer($custId));

        self::render();
    }

    public static function favoriteDish($dishid)
    {
        $custId        = Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $dishModel     = new \models\Dishes();
        $favDishes     = $dishModel->getFavoriteDishesForCustomer($custId, false);

        foreach ($favDishes as $dish)
        {
            if ($dish->dish_id == $dishid)
            {
                static::removeFavoriteDish($dishid);
                return;
            }
        }
        static::addFavoriteDish($dishid);
    }

    public static function addFavoriteDish($dishid)
    {
        $custId        = Customers::getByUserId(Security::get()->currentUser()->id)->id;
        $custFavDishes = new \models\CustFavDishes();

        $custFavDishes->cust_id = $custId;
        $custFavDishes->dish_id = $dishid;
        $custFavDishes->insert();

        return static::renderJson([
            'result' => true
        ]);

    }

    public static function removeFavoriteDish($dishid)
    {
        $custId        = Customers::getByUserId(Security::get()->currentUser()->id)->id;
        $custFavDishes = new \models\CustFavDishes();

        $custFavDishes->cust_id = $custId;
        $custFavDishes->dish_id = $dishid;
        $custFavDishes->delete();

        return static::renderJson([
            'result' => true
        ]);

    }

    public static function favoriteLocation($locationid)
    {
        $custId            = Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $locationModel     = new \models\Locations();
        $favLocations      = $locationModel->getFavoriteLocationsForCustomer($custId);

        foreach ($favLocations as $location)
        {
            if ($location->id == $locationid)
            {
                static::removeFavoriteLocation($locationid);
                exit;
            }
        }
        static::addFavoriteLocation($locationid);
    }

    public static function addFavoriteLocation($locationid)
    {
        $custId          = Customers::getByUserId(Security::get()->currentUser()->id)->id;
        $custFavLocation = new \models\CustFavLocation();

        $custFavLocation->cust_id = $custId;
        $custFavLocation->loc_id = $locationid;
        $custFavLocation->insert();

        return static::renderJson([
            'result' => true
        ]);

    }

    public static function removeFavoriteLocation($locationid)
    {
        $custId          = Customers::getByUserId(Security::get()->currentUser()->id)->id;
        $custFavLocation = new \models\CustFavLocation();

        $custFavLocation->cust_id = $custId;
        $custFavLocation->loc_id = $locationid;
        $custFavLocation->delete();

        return static::renderJson([
            'result' => true
        ]);

    }
}