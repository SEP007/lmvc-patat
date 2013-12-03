<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\LVC;
use \DateTime;
use Scandio\lmvc\modules\rendering\traits;

class Imbiss extends AnonymousController
{
    use traits\RendererController;

    public static function index($handle = null)
    {
        if ($handle == null) { return static::redirect('Application::index'); }

        $dishesModel = new \models\Dishes();
        $usersModel = new \models\Users();
		$customersModel = new\models\Customers();

        $user = Security::get()->currentUser();
        if ($user->username != "anonymous")
        {
			$custid = $customersModel->getByUserId($user->id)->id;
            $dishesRatingMap = \models\CustDishRating::getCustomerDishesRating($custid);
            $locRatingMap = \models\CustLocationRating::getCustomerLocRating($custid);

        }

        return static::render([
            'advertisedDishes'          =>  $dishesModel->getDishesByRestaurant($handle, false, true),
            'unadvertisedDishes'        =>  $dishesModel->getDishesByRestaurant($handle, false),
            'restaurant'                =>  $usersModel->getByHandle($handle),
            'dishesRatingMap'           =>  $dishesRatingMap,
            'locRatingMap'              =>  $locRatingMap
        ]);
    }

	/**
	 * Saves or cancels restaurant comment
	 * @param handle domain name of restaurant
	 * @param locationId id of location comment is created for
	 */
	public static function saveRestaurantComment($handle, $locationId)
	{
		$comment = new \models\Comments();
        $customersModel = new \models\Customers();

		$commentControl = static::request()->textAreaId;
		
		$comment->setDescription(static::request()->$commentControl);
		$comment->setCreation_date(date("Y-m-d"));
		$comment->setCreated_by($customersModel->getCustomerByUsername(Security::get()->currentUser()->username)->id);
		$comment->setLocation_id($locationId);

		$comment->save();
		return static::redirect('Imbiss::index', $handle);
	}

		/**
	 * Saves or cancels dish comment
	 * @param handle domain name of restaurant
	 * @param locationId id of location comment is created for
	 */
	public static function saveDishComment($handle, $dishId)
	{
		$comment = new \models\Comments();
		$customersModel = new \models\Customers();
		
		$commentControl = static::request()->textAreaId;
        
		$comment->setDescription(static::request()->$commentControl);
		$comment->setCreation_date(date("Y-m-d"));
		$comment->setCreated_by($customersModel->getCustomerByUsername(Security::get()->currentUser()->username)->id);
		$comment->setDish_id($dishId);

		$comment->save();
		return static::redirect('Imbiss::index', $handle);
	}
}