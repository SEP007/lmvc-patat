<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\LVC;
use Scandio\lmvc\modules\session\Session;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\modules\rendering\traits;

class Dishes extends AnonymousController
{
    use traits\RendererController;

    public static function index($longitude = null, $latitude = null)
    {
        $latitude = $latitude == '' ?  static::request()->latitude : $latitude;
        $longitude = $longitude == '' ?  static::request()->longitude : $longitude;

        Session::set("location.longitude", $longitude);
        Session::set("location.latitude", $latitude);

        if($longitude == null || $latitude == null) {
            static::redirect('Application::index');
        }

        $dishesModel = new \models\Dishes();
        self::setRenderArg('dishesGrouped', $dishesModel->getDishesWithinDistance($longitude, $latitude, 25, true));


        $customerModel = new \models\Customers();
        $user = Security::get()->currentUser();
        if ($user->username != "anonymous")
        {
            $custid = $customerModel->getByUserId($user->id)->id;
            self::setRenderArg('dishesFavorite', $dishesModel->getFavoriteDishesForCustomer($custid, true));
            self::setRenderArg('dishesRatingMap', \models\CustDishRating::getCustomerDishesRating($custid));
        }

        return static::render();
    }

    public static function map($userId)
    {
        $user = \models\Users::getByLocation($userId);

        return static::render([
            'user'    => $user
        ]);
    }

    public static function location($forUserid)
    {
        $user = \models\Users::getByLocation($forUserid);

        if ($user !== null) {
            return static::renderJson([
                'restaurant'    => $user->restaurant,
                'street'       => $user->street,
                'longitude'     => floatval($user->longitude),
                'latitude'      => floatval($user->latitude)
            ]);
        } else {
            return static::renderJson([
                'error' => 404,
                'msg'   => 'User for id: ' . $forUserid . ' not found.'
            ]);
        }
    }
}