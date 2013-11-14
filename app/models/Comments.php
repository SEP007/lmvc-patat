<?php

namespace models;

use troba\Model;

class Comments {
    use Model\Getters, Model\Finders, Model\Persisters;

    protected
        $id,
        $description,
        $creation_date,
        $created_by,
        $dish_id,
        $location_id;

    /**
     * @return mixed the id
     */
    protected function getId()
    {
        return $this->id;
    }

    /**
     * @param $id the new id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed the description
     */
    protected function getDescription()
    {
        return $this->description;
    }

    /**
     * @param $id the new description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return mixed the creation date
     */
    protected function getCreation_date()
    {
        return $this->creation_date;
    }

    /**
     * @param $id the new creation date
     */
    public function setCreation_date($creation_date)
    {
        $this->creation_date = $creation_date;
    }

    /**
     * @return mixed the created by
     */
    protected function getCreated_by()
    {
        return $this->created_by;
    }

    /**
     * @param $id the new created by
     */
    public function setCreated_by($created_by)
    {
        $this->created_by = $created_by;
    }

    /**
     * @return mixed the dish id
     */
    protected function getDish_id()
    {
        return $this->dish_id;
    }

    /**
     * @param $id the new dish id
     */
    public function setDish_id($dish_id)
    {
        $this->dish_id = $dish_id;
    }

    /**
     * @return mixed the location id
     */
    protected function getLocation_id()
    {
        return $this->location_id;
    }

    /**
     * @param $id the new location id
     */
    public function setLocation_id($location_id)
    {
        $this->location_id = $location_id;
    }

    /**
     * Gets comments for a restaurant determined by the given id
     * @param $id restaurant id
     * @return array comments for a restaurant determines by the given id
     */
    public function getCommentsByRestaurant($id) {
        $comments = static::query()
            ->select('*')
            ->where('Comments.location_id = :locationId', ['locationId' => $id])
            ->orderBy('Comments.creation_date DESC')
            ->all();

        return $comments;
    }

    /**
     * Gets comments for a dish determined by the given id
     * @param $id dish id
     * @return array comments for a dish determines by the given id
     */
    public function getCommentsByDish($id) {
        $comments = static::query()
            ->select('*')
            ->where('Comments.dish_id = :dishId', ['dishId' => $id])
            ->orderBy('Comments.creation_date DESC')
            ->all();

        return $comments;
    }
}