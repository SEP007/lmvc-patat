<?php

namespace models;

use troba\Model;
use \DateTime;

class OpenTimes
{
    use Model\Getters, Model\Finders, Model\Persisters;
	
	/*
	 * Ask the database for the information of opening hours for the weekdays
	 */
	 
	public function getOpeningTimeswd($restaurant) {
        $opentimes = static::query()
            ->select('*')
			/*  
			 * here we take Monday because right now Patat shows only weekdays and weekends
			 * and not every day separately
			*/
            ->where('restaurant_id = :restaurant AND week_day = :weekday', 
            	[
            		'restaurant' => $restaurant,
            		'weekday' => 'Monday'
            	]
			)
            ->all();

        return $opentimes;
    }
	
	/*
	 * Ask the database for the information of opening hours for the weekends
	 */
	 
	public function getOpeningTimeswe($restaurant) {
        $opentimes = static::query()
            ->select('*')
			/*
			 * here we take Saturday for the same reason we take Monday above
			 */
            ->where('restaurant_id = :restaurant AND week_day = :weekday', 
            	[
            		'restaurant' => $restaurant,
            		'weekday' => 'Saturday'
            	]
			)
            ->all();

        return $opentimes;
    }

    /**
     * Gets opening times of a restaurant for today
     * @param $restaurant id of a restaurant
     * @return object opening times
     */
    public static function getOpeningTimeToday($restaurant)
    {
        $today = new DateTime();
        $dw = date( "w", $today->getTimestamp());
        switch ($dw) {
            case "1": $day = "Monday"; break;
            case "2": $day = "Tuesday"; break;
            case "3": $day = "Wednesday"; break;
            case "4": $day = "Thursday"; break;
            case "5": $day = "Friday"; break;
            case "6": $day = "Saturday"; break;
            case "7": $day = "Sunday"; break;
        };

        $opentimes = static::query()
            ->select('*')
            ->where('restaurant_id = :restaurant AND week_day = :weekday',
                [
                    'restaurant' => $restaurant,
                    'weekday' => $day
                ]
            )
            ->one();

        return $opentimes;
    }

    /**
     * Checks the time left to the closing of a restaurant
     * @param $restaurantid id of a restaurant
     * @return string time left to closing  to be displayed on a restaurant page
     *          if the place is closed — displays corresponding message
     */
    public static function getTimeLeftOpen($restaurantid)
    {
        $today = new DateTime();
        $currenttime = $today->format("H:i:s");

        $closingtime = static::getOpeningTimeToday($restaurantid)->closing_time;
        if ($closingtime == null)
        {
            return null;
        }
        elseif (strtotime($currenttime) > strtotime($closingtime))
        {
            return -1;
        }
        else
        {
            $diff = gmdate("H",strtotime($closingtime)-strtotime($currenttime)) . " h " .
                gmdate("i",strtotime($closingtime)-strtotime($currenttime)) . " min";
            return $diff;
        }
    }

}