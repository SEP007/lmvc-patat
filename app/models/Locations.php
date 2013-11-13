<?php

namespace models;

use troba\Model;

class Locations
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public function getFavoritePlacesForCustomer($custId)
    {
        $location = static::query()
            ->select('*')
            ->innerJoin(new CustFavLocation(), 'CustFavLocation.loc_id = Locations.id')
            ->innerJoin(new Users(), 'Users.id = Locations.id')
            ->where('CustFavLocation.cust_id = :id', ['id' => $custId])
            ->all();

        return $location;
    }
}