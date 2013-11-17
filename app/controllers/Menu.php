<?php

namespace controllers;

use models\Categories;
use Scandio\lmvc\modules\security\SecureController;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\modules\rendering\traits;

class Menu extends SecureController
{
    use traits\RendererController;

    public static function index()
    {
        $userId = \models\Users::findBy('username', Security::get()->currentUser()->username)->one()->id;

        $dishes = \models\Dishes::findBy('user_id', $userId);

        return static::render(['dishes' => $dishes]);
    }

    /**
     * Saves dish
     * @param null $id dish id
     * @return bool true if has been saved successfully
     */
    public static function save($id = null)
    {
        $isPost = static::request()->save;
        $userId = Security::get()->currentUser()->id;
        $dishModel = new \models\Dishes();

        if (is_null($id)) {
            // add new dish
            $dish = $dishModel;
        } else {
            // edit existing dish
            $dish = $dishModel->getDishByUser($id, $userId);
        }

        $form = new \forms\Dish();
        $form->validate(static::request());

        if ($isPost) {
            // prepare saving
            $dish->user_id = \models\Users::findBy('username', Security::get()->currentUser()->username)->one()->id;
            $dish->setName(static::request()->name);
            $dish->setImg(static::request()->img);
            $dish->setPrice(static::request()->price);
            $dish->setDescription(static::request()->description);
            $dish->setAdvertised(static::request()->advertised ? static::request()->advertised : "0");
            $category_id = static::request()->category;
            if ($category_id != -1) {
                $dish->setCategory_id($category_id);
            }
        }

        if ($form->isValid() && $dish->save()) {
            // save dish
            return static::redirect('Menu::index');
        }
    }

    /**
     * Prepare for edit view
     * @param null $id dish id
     * @return bool true if edit view has been successfully prepared
     */
    public static function edit($id = null)
    {
        $advertiseLimit = 3;
        $categories = Categories::findAll();
        $userId = Security::get()->currentUser()->id;
        $dishModel = new \models\Dishes();
        $advertisedDishes = $dishModel->getDishesByUserId($userId, true);

        if (is_null($id)) {
            // add new dish
            $dish = $dishModel;
            $disableAdvertise = $advertisedDishes->count() >= $advertiseLimit;
        } else {
            // edit existing dish
            $dish = $dishModel->getDishByUser($id, $userId);
            $disableAdvertise = (($advertisedDishes->count() >= $advertiseLimit) && !$dish->getAdvertised());
        }

        $form = new \forms\Dish();
        $form->validate(static::request());

        // edit/add dish
        return static::render([
            'dish'      => $dish,
            'img'       => static::request()->img,
            'errors'    => [],
            'categories' => $categories,
            'disableAdvertise' => $disableAdvertise
        ]);
    }

    public static function delete($id)
    {
        \models\Dishes::find($id)->delete();

        return static::redirect('Menu::index');
    }
}