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
            ->select('*')
            ->innerJoin(new Locations(), 'Locations.user_id = Users.id')
            ->where('Locations.handle= :handle', ['handle' => $handle])
            ->one();

        return $user;
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
        $user -> randomkey = $randomkey;

        $user -> save();
        return $randomkey;
    }
}