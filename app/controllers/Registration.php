<?php

namespace controllers;

use Scandio\lmvc;
use Scandio\lmvc\Controller;
use Scandio\lmvc\modules\registration\controllers;
use \models;
use \forms;
use \util;
use Scandio\lmvc\modules\security;

class Registration extends controllers\Registration
{
    public static function register()
    {
        static::render();
    }

    public static function signupCustomer()
    {
        static::render();
    }

    public static function signupRestaurant()
    {
        static::render();
    }

    public static function getSuggestHandle($restaurant = null)
    {
        $handle = \util\String::urlSlug($restaurant);

        return static::renderJson([
            'handle'        => $handle,
            'isUsed'        => strlen($handle) <= 5 || strlen($restaurant) <= 5 ? true : \models\Locations::findBy('handle', $handle)->count() > 0,
            'restaurant'    => $restaurant
        ]);
    }

    public static function getValidateHandle($handle = null)
    {
        return static::renderJson([
            'handle'        => $handle,
            'isUsed'        => strlen($handle) <= 5 ? true : \models\Locations::findBy('handle', $handle)->count() > 0
        ]);
    }

    /**
     * Post request with restaurant signup data
     */
    public static function postSignupRestaurant()
    {
        $signupForm = new forms\SignupRestaurant();
        $signupForm->setAsPost(false);
        $signupForm->validate(static::request());

        if (! $signupForm->isValid()) {
            return static::render([
                'error'     => true,
                'errors'    => $signupForm->getErrors(),
                'user'      => static::request()
            ]);
        } else {
            $parentResponse = parent::postSignup(false);

            if ($parentResponse) {
                $location = new \models\Locations();
                $userToGroup = new \models\UserToGroups();

                $location->user_id      = $parentResponse->id;
                $location->longitude    = static::request()->longitude;
                $location->latitude     = static::request()->latitude;
                $location->accuracy     = static::request()->accuracy;
                $location->restaurant   = static::request()->restaurant;
                $location->handle       = static::request()->handle;
                $location->city         = static::request()->city;
                $location->zip          = static::request()->zip;
                $location->street       = static::request()->place;

                $userToGroup->user_id   = $location->user_id;
                $userToGroup->group_id  = 2;

                $location->insert();
                $userToGroup->insert();

                static::redirect('Menu::index');

            } else {
                # This does not imply a form-validation error, its the last resort...
                static::redirect('Registration::failure');
            }
        }
    }

    /**
     * Post request with customer signup data
     */
    public static function postSignupCustomer()
    {
        $signupForm = new forms\SignupCustomer();
        $signupForm->validate(static::request());

        if (! $signupForm->isValid()) {
            return static::render([
                'error'     => true,
                'errors'    => $signupForm->getErrors(),
                'user'      => static::request()
            ]);
        } else {
            $parentResponse = parent::postSignup(false);

            if ($parentResponse) {
                $customer = new \models\Customers();
                $userToGroups = new \models\UserToGroups();

                $customer->user_id      = $parentResponse->id;

                $userToGroups->user_id  = $customer->user_id;
                $userToGroups->group_id = 3;

                $customer->insert();
                $userToGroups->insert();

                static::redirect('Menu::index');

            } else {
                # This does not imply a form-validation error, its the last resort...
                static::redirect('Registration::failure');
            }
        }
    }

    public static function editRestaurant($redirect = true)
    {
        $userId             = security\Security::get()->currentUser()->id;

        $userModel          = \models\Users::getByLocation($userId);

        return static::render([
            'user' => $userModel
        ]);
    }

    /**
     * Post request with restaurant modified data
     */
    public static function postEditRestaurant()
    {
        $signupForm = new forms\SignupRestaurant();
        $signupForm->setAsPost(true);
        $signupForm->validate(static::request());

        if (!$signupForm->isValid()) {
            return static::render([
                'error'     => true,
                'errors'    => $signupForm->getErrors(),
                'user'      => static::request()
            ]);
        } else {
            $parentResponse     = parent::postEdit(false);
            $userId             = security\Security::get()->currentUser()-id;

            if ($parentResponse) {
                $location               = new \models\Locations();
                $location               = $location::findBy('user_id', $userId)->one();
                $location->user_id      = $userId;
                $location->longitude    = static::request()->longitude;
                $location->latitude     = static::request()->latitude;
                $location->accuracy     = static::request()->accuracy;
                $location->restaurant   = static::request()->restaurant;
                $location->handle       = static::request()->handle;
                $location->city         = static::request()->city;
                $location->zip          = static::request()->zip;
                $location->street       = static::request()->place;

                $location->save();

                static::render([
                    'success'   => true,
                    'user'      => static::request()
                ]);
            } else {
                # This does not imply a form-validation error, its the last resort...
                static::redirect('Registration::failure');
            }
        }
    }

    public static function editCustomer()
    {
        $userId             = security\Security::get()->currentUser()->id;

        $userModel          = \models\Users::query()
            ->select('*')
            ->innerJoin(new \models\Customers(), 'Users.id = Customers.user_id')
            ->where('Users.id = :user_id', ['user_id' => $userId])
            ->one();

        return static::render([
            'user' => $userModel
        ]);
    }

    /**
     * Post request with customer modified data
     */
    public static function postEditCustomer()
    {
        $signupForm = new forms\SignupCustomer();
        $signupForm->validate(static::request());

        if (!$signupForm->isValid()) {
            return static::render([
                'error'     => true,
                'errors'    => $signupForm->getErrors(),
                'user'      => static::request()
            ]);
        } else {
            $parentResponse     = parent::postEdit(false);
            $userId             = security\Security::get()->currentUser()-id;

            if ($parentResponse) {
                $customer               = new \models\Users();
                $customer               = $customer::findBy('id', $userId)->one();
                $customer->user_id      = $userId;

                $customer->save();

                static::render([
                    'success'   => true,
                    'user'      => static::request()
                ]);
            } else {
                # This does not imply a form-validation error, its the last resort...
                static::redirect('Registration::failure');
            }
        }
    }
}