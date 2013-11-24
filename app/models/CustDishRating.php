<?php

namespace models;

use troba\Model;

class CustDishRating
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public $__table = "Cust_Dish_Rating";

    public static function getCustomerDishesRating($custId)
    {
        $dishesRating = static::query()
            ->select('*' )
            ->where('cust_id = :id', ['id' => $custId])
            ->all();

        foreach ($dishesRating as $element){
            $dishesRatingMap[$element->dish_id] = $element->rating;
        }

        return $dishesRatingMap;
    }

    public static function getDishRating($custId, $dishId){
        $dishesRating = static::query()
            ->select('*' )
            ->where('cust_id = :custid', ['custid' => $custId])
            ->andWhere('dish_id = :dishid', ['dishid'=> $dishId])
            ->all();
        return empty($dishesRating) ? null : $dishesRating[0];
    }
}