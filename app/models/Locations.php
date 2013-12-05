<?php

namespace models;

use troba\Model;
use \models;
use Scandio\lmvc\modules\security\Security;

class Locations
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public function getFavoriteLocationsForCustomer($custId)
    {
        $location = static::query()
            ->select('*')
            ->innerJoin(new CustFavLocation(), 'CustFavLocation.loc_id = Locations.id')
            ->innerJoin(new Users(), 'Users.id = Locations.id')
            ->where('CustFavLocation.cust_id = :id', ['id' => $custId])
            ->all();

        return $location;
    }

    public static function isFavoriteLocation($locationid)
    {
        $custid = Customers::getByUserId(Security::get()->currentUser()->id)->id;

        $CustFavLocations = CustFavLocation::query()
            ->select('*')
            ->where('cust_id = :custid', ['custid' => $custid])
            ->andWhere('loc_id = :locationid', ['locationid' => $locationid])->all();
        return count($CustFavLocations) === 0 ? false : true;
    }

    public static function getLocation($locId) {
        $locations = static::query()
            ->select('*')
            ->where('id = :locId', ['locId' => $locId])
            ->all();

        return empty($locations) ? null : $locations[0];
    }
}