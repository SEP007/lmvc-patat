<?php

namespace controllers;

use Scandio\lmvc\modules\security\AnonymousController;
use Scandio\lmvc\modules\security\Security;
use \models;
use Scandio\lmvc\modules\rendering\traits;
use Scandio\lmvc\modules\session\Session;

class Rating extends AnonymousController
{
    use traits\RendererController;

    public static function rateDish ($dishId, $rating){
        $rating = intval($rating);
        //Validates rating input
        if($rating < 1 || $rating > 5){
            return static::renderJson([
                'error' => 'Rating out of boundaries!'
            ]);
        }
        $custId = \models\Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $dish = \models\Dishes::getDish($dishId);
        $dishRating = \models\CustDishRating::getDishRating($custId, $dishId);
        $custRating = null;

        if (is_null($dishRating)){
            $dishRating = new \models\CustDishRating();
            $dishRating->cust_id=$custId;
            $dishRating->dish_id=$dishId;
            $dishRating->rating=$rating;
            $dishRating->insert();
        } else {
            $custRating = $dishRating->rating;
            $dishRating->rating=$rating;
            $dishRating->update();
        }
        $dish->avg_rating = self::calculateRating($dish->avg_rating, $custRating, $rating, $dish->num_votes);
        if (is_null($custRating)){
            $dish->num_votes = $dish->num_votes + 1;
        }
        $dish->update();

        $dishWithLoc = \models\Dishes::getDishWithLocation($dishId);

        return static::renderJson([
            'dish_id' => $dish->id,
            'location_id' => $dishWithLoc->location_id,
            'rating' => $dish->avg_rating,
            'int_rating' => round($dish->avg_rating),
            'num_votes' => $dish->num_votes
        ]);
    }

    public static function rateRestaurant ($locId, $rating){
        $rating = intval($rating);
        //Validates rating input
        if($rating < 1 || $rating > 5){
            return static::renderJson([
                'error' => 'Rating out of boundaries!'
            ]);
        }
        $custId = \models\Customers::getByUserId(Security::get()->currentUser()->id)->id;
        $location = \models\Locations::getLocation($locId);
        $locRating = models\CustLocationRating::getLocRating($custId, $locId);
        $custRating = null;

        if (is_null($locRating)){
            $locRating = new \models\CustLocationRating();
            $locRating->cust_id=$custId;
            $locRating->location_id=$locId;
            $locRating->rating=$rating;
            $locRating->insert();
        } else {
            $custRating = $locRating->rating;
            $locRating->rating=$rating;
            $locRating->update();
        }
        $location->avg_rating = self::calculateRating($location->avg_rating, $custRating, $rating, $location->num_votes);
        if (is_null($custRating)){
            $location->num_votes = $location->num_votes + 1;
        }
        $location->update();


        return static::renderJson([
            'location_id' => $locId,
            'rating' => $location->avg_rating,
            'int_rating' => round($location->avg_rating),
            'num_votes' => $location->num_votes
        ]);
    }

    private static function calculateRating ($avgRating, $custRating, $newCustRating, $numRates){
        //rating formula
        $sumRatings = $avgRating*$numRates;
        $rating = (round($sumRatings, 1, PHP_ROUND_HALF_EVEN) - $custRating + $newCustRating);
        //check if the user has already rated this dish
        if (is_null($custRating)){
            $rating = $rating / ($numRates + 1);
        } else {
            $rating = $rating / $numRates;
        }
        return $rating;
    }
}