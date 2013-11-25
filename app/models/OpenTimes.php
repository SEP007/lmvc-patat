<?php

namespace models;

use troba\Model;

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
	
	
}