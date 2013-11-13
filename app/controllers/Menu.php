<?php

namespace controllers;

use models\Categories;
use Scandio\lmvc\modules\security\SecureController;
use Scandio\lmvc\modules\security\Security;

class Menu extends SecureController {

    public static function index()
    {
        $userId = \models\Users::findBy('username', Security::get()->currentUser()->username)->one()->id;

        $dishes = \models\Dishes::findBy('user_id', $userId);

        return static::render(['dishes' => $dishes]);
    }

    public static function edit($id = null)
    {
        $isPost = static::request()->save;
        $categories = Categories::findAll();

        if (is_null($id)) {
            $dish = new \models\Dishes();
        } else {
            $dishModel = new \models\Dishes();
            $dish = $dishModel->getDishByUser($id, Security::get()->currentUser()->id);
        }

        $form = new \forms\Dish();
        $form->validate(static::request());

        if ($isPost) {
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
            return static::redirect('Menu::index');
        } else {
            return static::render([
                'dish'      => $dish,
                'img'       => static::request()->img,
                'errors'    => $isPost ? $form->getErrors() : [],
                'categories' => $categories
            ]);
        }

        return static::render([
            'dish' => $dish,
            'categories' => $categories
        ]);
    }

    public static function delete($id)
    {
        \models\Dishes::find($id)->delete();

        return static::redirect('Menu::index');
    }
}