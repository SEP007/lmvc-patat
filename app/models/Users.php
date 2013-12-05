<?php

namespace models;

use troba\Model;

class Users
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public static function getByLocation($userId) {
        $user = static::query()
            ->select('*')
            ->innerJoin(new Locations(), 'Locations.user_id = Users.id')
            ->where('Users.id= :id', ['id' => $userId])
            ->one();

        return $user;
    }

    public static function getByHandle($handle) {
        $user = static::query()
            ->select('*, Locations.id as location_id')
            ->innerJoin(new Locations(), 'Locations.user_id = Users.id')
            ->where('Locations.handle= :handle', ['handle' => $handle])
            ->one();

        return $user;
    }

    /**
     * Finds user by customer determined by the given id and returns user name only
     * @param $id customer id
     */
    public static function getUsernameByCustomerId($id)
    {
        $user = static::query()
            ->select('*')
            ->innerJoin(new Customers(), 'Customers.user_id = Users.id')
            ->where('Customers.id= :id', ['id' => $id])
            ->one();

        return $user->username;
	}
	
    public static function getByEmail($email){
        $user = static::query()
            ->select('*')
            ->where('email= :email', ['email' =>$email])
            ->one();

        return $user;
    }

    public static function setRandomKey($userId){
        $user = static::query()
            ->select('*')
            ->where('id= :id', ['id' =>$userId])
            ->one();
        $randomkey = md5(rand(0,1000));
        $user->randomkey = $randomkey;

        $user->save();
        return $randomkey;
    }
}