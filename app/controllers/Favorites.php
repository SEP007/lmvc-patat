<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use \models;
use Scandio\lmvc\modules\rendering\traits;

class Favorites extends AnonymousController
{
    use traits\RendererController;

    public static function index()
    {
        $CustomerModel = new \models\Customers();
        $custId        = $CustomerModel->getByUserId(Security::get()->currentUser()->id)->id;

        $dishesModel = new \models\Dishes();

        self::setRenderArg('dishes', $dishesModel->
            getFavoriteDishesForCustomer($custId, false));

        self::render();
    }

    public static function locations()
    {
        $CustomerModel = new \models\Customers();
        $custId        = $CustomerModel->getByUserId(Security::get()->currentUser()->id)->id;

        $locationModel = new \models\Locations();

        self::setRenderArg('locations', $locationModel->
            getFavoriteLocationsForCustomer($custId));

        self::render();
    }

    public static function favoriteDish($dishid)
    {
        $CustomerModel = new \models\Customers();
        $userid = Security::get()->currentUser()->id;
        $custid = $CustomerModel->getByUserId($userid)->id;

        $dishModel     = new \models\Dishes();
        $favDishes = $dishModel->getFavoriteDishesForCustomer($custid, false);

        foreach ($favDishes as $dish)
        {
            if ($dish->dish_id == $dishid)
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

    public static function favoriteLocation($locationid)
    {
        $CustomerModel = new \models\Customers();
        $userid = Security::get()->currentUser()->id;
        $custid = $CustomerModel->getByUserId($userid)->id;

        $locationModel     = new \models\Locations();
        $favLocations      = $locationModel->getFavoriteLocationsForCustomer($custid);

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
        $CustFavLocation = new \models\CustFavLocation();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavLocation->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavLocation->loc_id = $locationid;
        $CustFavLocation->insert();

        return static::renderJson([
            'result' => true
        ]);

    }

    public static function removeFavoriteLocation($locationid)
    {
        $CustFavLocation = new \models\CustFavLocation();
        $CustomerModel = new \models\Customers();

        $userid = Security::get()->currentUser()->id;

        $CustFavLocation->cust_id = $CustomerModel->getByUserId($userid)->id;
        $CustFavLocation->loc_id = $locationid;
        $CustFavLocation->delete();

        return static::renderJson([
            'result' => true
        ]);

    }
}