<?php

namespace models;

use troba\Model;

class Customers
{
    use Model\Getters, Model\Finders, Model\Persisters;

    /**
     * Gets customer by user name
     * @param $username the user name
     * @return array a customer by user name
     */
    public function getCustomerByUsername($username) {
        $customer = static::query()
            ->select('Customers.*')
            ->innerJoin(new Users(), 'Customers.user_id = Users.id')
            ->where('Users.username = :username', ['username' => $username])
            ->one();

        return $customer;			
	}

    public static function getByUserId($userid)
    {
        $customer = static::query()
            ->select('*')
            ->where('user_id = :userid', ['userid' => $userid])
            ->one();

        return $customer;
    }
}