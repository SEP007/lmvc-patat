<?php

namespace forms;

use Scandio\lmvc\modules\registration\forms;

class SignupRestaurant extends forms\Signup
{
    private $isPost = false;

    public $restaurant = [
        'mandatory' => ['message' => 'A name for your restaurant is compulsory!'],
    ];
    public $city = [
        'mandatory' => ['message' => 'Type a city please!']
    ];
    public $zip = [
        'mandatory' => ['message' => 'The zip code is needed!']
    ];
    public $place = [
        'mandatory' => ['message' => 'Mandatory field missing here!']
    ];
    public $username = [
        'check-username' => ['message' => 'That username: "%s" is too short!'],
        'mandatory' => ['message' => 'Please give us a username!']
    ];
    public $email = [
        'check-email' => ['message' => 'The E-Mail: "%s" ain\'t valid!'],
        'mandatory' => ['message' => 'Please give us an E-Mail!']
    ];
    public $password = [
        'check-password' => ['message' => 'Password must be between 3-30 characters!'],
        'mandatory' => ['message' => 'Those passwords don\'t match, try again!']
    ];
    public $passwordRetyped = [
        'mandatory' => ['message' => 'For you own sake: retype the password!'],
        'check-password-retyped' => ['message' => 'Nope, these two passwords do not match!']
    ];
    public $handle = [
        'mandatory' => ['message' => 'Please pick a url, its your address!'],
        'check-handle' => ['message' => 'This url is too short!']
    ];

    public function setAsPost($isPost)
    {
        $this->isPost = $isPost;
    }

    protected function checkHandle($name)
    {
        if ($this->isPost) return;

        if (!empty($this->request()->$name) && strlen($this->request()->$name) <= 5
            || (\models\Locations::findBy('handle', $this->request()->$name)->count() > 0)
        ) {
            $this->setError($name, array($this->request()->$name));
        }
    }
}