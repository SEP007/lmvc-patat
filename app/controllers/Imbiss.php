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
        $sessionUser = Security::get()->currentUser();
        $customersModel = new \models\Customers();

        return static::render([
            'advertisedDishes'          =>  $dishesModel->getDishesByRestaurant($handle, false, true),
            'unadvertisedDishes'        =>  $dishesModel->getDishesByRestaurant($handle, false),
            'restaurant'                =>  $usersModel->getByHandle($handle),
            'loggedInCustomer'          =>  $customersModel->getCustomerByUsername($sessionUser->username)
        ]);
    }

	/**
	 * Saves or cancels restaurant comment
	 * @param handle domain name of restaurant
	 * @param customerId id of customer that creates comment
	 * @param locationId id of location comment is created for
	 */
	public static function saveRestaurantComment($handle, $customerId, $locationId)
	{
		$comment = new \models\Comments();

		$commentControl = static::request()->textAreaId;
		
		$comment->setDescription(static::request()->$commentControl);
		$comment->setCreation_date(date("Y-m-d"));
		$comment->setCreated_by($customerId);
		$comment->setLocation_id($locationId);

		$comment->save();
		return static::redirect('Imbiss::index', $handle);
	}

		/**
	 * Saves or cancels dish comment
	 * @param handle domain name of restaurant
	 * @param customerId id of customer that creates comment
	 * @param locationId id of location comment is created for
	 */
	public static function saveDishComment($handle, $customerId, $dishId)
	{
		$comment = new \models\Comments();
		
		$commentControl = static::request()->textAreaId;
        
		$comment->setDescription(static::request()->$commentControl);
		$comment->setCreation_date(date("Y-m-d"));
		$comment->setCreated_by($customerId);
		$comment->setDish_id($dishId);

		$comment->save();
		return static::redirect('Imbiss::index', $handle);
	}
}