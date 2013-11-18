<?php

namespace util;

use Scandio\lmvc\modules\session\Session;

class Location {

    /**
     * Calculates the distance between two points using longitude and latitude.
     * Uses haversine formula
     * Credits to http://www.movable-type.co.uk/scripts/latlong.html
     * @param $longitude longitude of the final destination
     * @param $latitude latitude of the final destination
     * @return float distance in km
     */
    public static function getDistanceTo($longitude,$latitude)
    {
        $userlongitude = Session::get("location.longitude");
        $userlatitude  = Session::get("location.latitude");

        $R = 6371; // Radius of the earth in km
        $dLat = deg2rad($userlatitude-$latitude);
        $dLon = deg2rad($userlongitude-$longitude);
        $a =
            sin($dLat/2) * sin($dLat/2) +
            cos(deg2rad($latitude)) * cos(deg2rad($userlatitude)) *
            sin($dLon/2) * sin($dLon/2);
        $c = 2 * atan2(sqrt($a), sqrt(1-$a));
        $d = $R * $c; // Distance in km

        return round($d,1) . ' km';
    }

} 