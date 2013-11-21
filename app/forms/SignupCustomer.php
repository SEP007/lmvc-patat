<?php

namespace forms;

use Scandio\lmvc\modules\registration\forms;
use \models\Users;

class SignupCustomer extends forms\Signup
{
    private $isPost = false;

    public $username = [
        'check-username' => ['message' => 'That username: "%s" is too short!'],
        'mandatory' => ['message' => 'Please give us a username!'],
        'check-taken' => ['message' => 'The username "%s" is already taken!']
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

    public function setAsPost($isPost)
    {
        $this->isPost = $isPost;
    }

    protected function checkUsername($name)
    {
        if ($this->isPost) return;

        parent::checkUsername($name);
    }

    protected function checkTaken($name)
    {
        $username = $this->request()->$name;

        $count = Users::findBy("username", $username)->count();
        if ($count > 0)
        {
            $this->setError($name, [$username]);
        }
    }
}