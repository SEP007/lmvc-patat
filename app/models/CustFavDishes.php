<?php

namespace models;

use Scandio\lmvc\modules\security\handlers\database\models\Users;
use troba\Model;

class CustFavDishes
{
    use Model\Getters, Model\Finders, Model\Persisters;

    public $__table = "Cust_Fav_Dishes";

}