<?php

namespace models;

use troba\Model;

class Categories {
    use Model\Getters, Model\Finders, Model\Persisters;

    protected
        $id,
        $name;

    /**
     * Sets the id
     * @param $id the id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * Gets the id
     * @return mixed the id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Sets the name
     * @param $name the name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Gets the name
     * @return mixed the name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Gets category name by id
     * @param $id the id
     * @return object category name by id
     */
    public static function getNameById($id) {
        $category = static::query()
            ->select('*')
            ->where('Categories.id = :id',['id' => $id]
            )
            ->one();

        return $category != null ? $category->name : "";
    }
}