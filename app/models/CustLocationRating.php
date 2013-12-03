<?php

namespace models;

use troba\Model;

class CustLocationRating
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public $__table = "Cust_Location_Rating";

    public static function getCustomerLocRating($custId)
    {
        $locationsRating = static::query()
            ->select('*' )
            ->where('cust_id = :id', ['id' => $custId])
            ->all();

        foreach ($locationsRating as $element){
            $locationsRatingMap[$element->location_id] = $element->rating;
        }

        return $locationsRatingMap;
    }

    public static function getLocRating($custId, $locId){
        $locationsRating = static::query()
            ->select('*' )
            ->where('cust_id = :custid', ['custid' => $custId])
            ->andWhere('location_id = :locId', ['locid'=> $locId])
            ->all();
        return empty($locationsRating) ? null : $locationsRating[0];
    }
}