<?php

namespace controllers;

use models\Categories;
use Scandio\lmvc\modules\security\SecureController;
use Scandio\lmvc\modules\security\Security;
use Scandio\lmvc\modules\rendering\traits;

class Menu extends SecureController
{
    use traits\RendererController;

    private static
        $_advertiseLimit = 3;

    public static function index()
    {
        $userId = \models\Users::findBy('username', Security::get()->currentUser()->username)->one()->id;

        $dishes = \models\Dishes::findBy('user_id', $userId);

        return static::render(['dishes' => $dishes]);
    }

    public static function edit($id = null)
    {
        $userId = Security::get()->currentUser()->id;
        $categories = Categories::findAll();
        $dishModel = new \models\Dishes();
        $advertisedDishes = $dishModel->getDishesByUserId($userId, true);
        $disableAdvertise = $advertisedDishes->count() >= static::$_advertiseLimit;

        if ($id !== null) {
            $dishModel = $dishModel->getDishByUser($id, $userId);
        }

        return static::render([
            'dish'              => $dishModel,
            'img'               => static::request()->img,
            'errors'            => [],
            'categories'        => $categories,
            'disableAdvertise'  => $disableAdvertise
        ]);
    }

    /**
     * Prepare for edit view
     * @param null $id dish id
     * @return bool true if edit view has been successfully prepared
     */
    public static function postEdit()
    {
        $categories = Categories::findAll();
        $userId = Security::get()->currentUser()->id;
        $dishModel = new \models\Dishes();
        $advertisedDishes = $dishModel->getDishesByUserId($userId, true);
        $category_id = static::request()->category;

        $form = new \forms\Dish();
        $form->validate(static::request());

        $disableAdvertise = (
            !$dishModel->getAdvertised() &&
            count($advertisedDishes) >= static::$_advertiseLimit
        );

        $dishModel->user_id = $userId;
        $dishModel->setName(static::request()->name);
        $dishModel->setImg(static::request()->img);
        $dishModel->setPrice(static::request()->price);
        $dishModel->setDescription(static::request()->description);
        $dishModel->setAdvertised(static::request()->advertised ? static::request()->advertised : "0");

        if ($category_id != -1) { $dishModel->setCategory_id($category_id); }

        if ($form->isValid() && $dishModel->save()) {
            return static::redirect('Menu::index');
        } else {
            return static::render([
                'dish'              => $dishModel,
                'img'               => static::request()->img,
                'errors'            => $form->getErrors(),
                'categories'        => $categories,
                'disableAdvertise'  => $disableAdvertise
            ]);
        }
    }

    public static function delete($id)
    {
        $comments = \models\Comments::findBy('dish_id', $id);

        foreach($comments as $comment) {
            $comment->delete();
        }

        \models\Dishes::find($id)->delete();

        return static::redirect('Menu::index');
    }
}