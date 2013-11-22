<?php

namespace forms;

use Scandio\lmvc\modules\form\Form;

class Dish extends Form
{
    public $name = [
        'mandatory' => ['message' => 'We need your name!']
    ];
    public $description = [
        'check-description' => ['message' => 'Your description: "%s" seems too short!'],
        'mandatory' => ['message' => 'Well, we need a description!']
    ];
    public $price = [
        'mandatory' => ['message' => 'You might want to add a price!'],
        'check-price' => ['message' => 'We figured that this is not a valid price!']
    ];

    protected function checkDescription($name)
    {
        if (!empty($this->request()->$name) && strlen(trim($this->request()->$name)) < 15) {
            $this->setError($name, array($this->request()->$name));
        }
    }

    protected function checkPrice($name)
    {
        if (!preg_match('=^\d*\,?\d*$=is', $this->request()->$name)
        ) {
            $this->setError($name, array($this->request()->$name));
        }
    }
}