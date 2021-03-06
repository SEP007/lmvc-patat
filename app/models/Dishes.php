<?php

namespace models;

use troba\Model;

class Dishes
{
    use Model\Getters, Model\Finders, Model\Persisters;

    protected
        $id,
        $advertised,
        $name,
        $img,
        $price,
        $description,
        $distance,
        $category_id;

    public function setImg($img)
    {
        $this->img = $img ?: $this->img;
    }

    public function getImg()
    {
        return $this->img;
    }

    public function setAdvertised($advertised)
    {
        $this->advertised = $advertised;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function setDistance($distance)
    {
        $this->distance = $distance;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function getAdvertised()
    {
        return $this->advertised;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Gets the category id
     * @return mixed the category id
     */
    public function getCategory_id()
    {
        return $this->category_id;
    }

    /**
     * Sets the category id
     * @param $categoryId the category id
     */
    public function setCategory_id($categoryId)
    {
        $this->category_id = $categoryId;
    }

    public function getAllDishes($group = false) {
        $dishes = static::query()
            ->select('*')
            ->innerJoin(new Users(), 'Dishes.user_id = Users.id')
            ->where('Dishes.advertised = :advertised', ['advertised' => '1'])
            ->orderBy('Dishes.name')
            ->all();

        return $group === true ? $this->_groupDishes($dishes) : $dishes;
    }

    public function getDishesByRestaurant($handle, $group = true, $advertised = false) {
        $dishes = static::query()
            ->select('Dishes.*')
            ->innerJoin(new Locations(), 'Dishes.user_id = Locations.id')
            ->where('Locations.handle = :handle', ['handle' => $handle])
            ->andWhere('Dishes.advertised = :advertised', ['advertised' => (string) $advertised])
            ->orderBy('Dishes.name')
            ->all();

        return $group === true ? $this->_groupDishes($dishes) : $dishes;
    }

    public function getDishesWithinDistance($longitude, $latitude, $distance = 25, $group = false) {
        $dishes = static::query()
            ->select('*,
                        ROUND(
                            ( 6371 * Acos(Cos(Radians(' . $latitude . ')) * Cos(Radians(latitude)) * Cos(
                                Radians(longitude) - Radians(' . $longitude . ')) + Sin
                                (Radians(' . $latitude . ')) * Sin(Radians(latitude)))
                        ), 4 ) AS distance,
                         Dishes.id as dish_id, Users.id as user_id, Locations.id as location_id,
                         Dishes.avg_rating as dish_avg_rating, Dishes.num_votes as dish_num_votes
                    ')
            ->innerJoin(new Users(), 'Dishes.user_id = Users.id')
            ->innerJoin(new Locations(), 'Locations.user_id = Users.id')
            ->where('Dishes.advertised = :advertised', ['advertised' => '1'])
            ->orderBy('Dishes.name')
            ->having('distance < :distance', ['distance' => $distance])
            ->all();

        return $group === true ? $this->_groupDishes($dishes) : $dishes;
    }

    public function getDishByUser($dishId, $userId)
    {
        $dishes = static::query()
            ->select('*')
            ->where(
                'Dishes.user_id = :user_id AND Dishes.id = :dish_id',
                [
                    'user_id' => $userId,
                    'dish_id' => $dishId,
                ]
            )
            ->one();

        return $dishes;
    }

    public function getFavoriteDishesForCustomer($custId, $idonly)
    {
        $dishes = static::query()
            ->select('*, Dishes.id AS dish_id')
            ->innerJoin(new CustFavDishes(), 'Dishes.id = CustFavDishes.dish_id')
            ->innerJoin(new Locations(), 'Dishes.user_id = Locations.id')
            ->where('CustFavDishes.cust_id = :id', ['id' => $custId])
            ->all();

        if ($idonly)
        {
            $favDishesId = [];
            foreach ($dishes as $dish){
                $favDishesId[] = $dish->dish_id;
            }
            return $favDishesId;
        }
        else
        {
            return $dishes;
        }
    }

    private function _groupDishes($dishes) {
        $dishesGrouped = [];

        foreach ($dishes as $dish) {
            $sortLetter = $dish->name[0];

            $dishesGrouped[$sortLetter]['sortLetter'] = $sortLetter;
            $dishesGrouped[$sortLetter]['dishes'][] = $dish;
        }

        $dishesGrouped = array_values($dishesGrouped);

        return $dishesGrouped;
    }

    public function getDistance() {
        $this->distance = floatval($this->distance);

        if ($this->distance < 1.0) {
            return $this->distance * 1000 . ' m';
        } else {
            return round($this->distance, 2) . ' km';
        }
    }

     /**
     * Get dishes by user id
     * @param $userId user id
     * @param bool $advertised if true then only advertised dishes are returned, otherwise only not advertised
     * @return array dishes by user id
     */
    public function getDishesByUserId($userId, $advertised = false) {
        $dishes = static::query()
            ->select('*')
            ->innerJoin(new Locations(), 'Dishes.user_id = Locations.user_id')
            ->where('Locations.user_id = :userId', ['userId' => $userId])
            ->andWhere('Dishes.advertised = :advertised', ['advertised' => (string) $advertised])
            ->orderBy('Dishes.name')
            ->all();

        return $dishes;
    }

    public static function getDish($dishId) {
        $dishes = static::query()
            ->select('*')
            ->where('id = :dishId', ['dishId' => $dishId])
            ->all();

        return empty($dishes) ? null : $dishes[0];
    }

    public static function getDishWithLocation($dishId) {
        $dishes = static::query()
            ->select('*, Dishes.id as dish_id, Locations.id as location_id')
            ->innerJoin(new Locations(), 'Dishes.user_id = Locations.user_id')
            ->where('Dishes.id = :dishId', ['dishId' => $dishId])
            ->all();

        return empty($dishes) ? null : $dishes[0];
    }

}