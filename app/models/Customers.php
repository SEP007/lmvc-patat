<?php

namespace models;

use troba\Model;

class Customers
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public static function getByUserId($userid)
    {
        $customer = static::query()
            ->select('*')
            ->where('user_id = :userid', ['userid' => $userid])
            ->one();

        return $customer;
    }
}