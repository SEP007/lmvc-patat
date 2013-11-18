<?php

namespace util;

use Scandio\lmvc\utils\config\Config;
use \util;

class Mail {

    /**
     * Sends a verification email
     * @param $username
     * @param $address email address of a user
     */
    public static function sendEmailVerification($username, $address, $randomkey)
    {
        $messageArgs = array(
            "username" => $username,
            "usernamehash" => md5($username),
            "email" => $address,
            "randomkey" => $randomkey
        );
        $subject = Config::get()->emails->subjects->registration;
        $message = Config::get()->emails->messages->registration . Config::get()->emails->links->emailVerification;
        $headers = 'From: ' . Config::get()->emails->sender . "\r\n";
        $headers .= Config::get()->emails->headers->content;
        mail($address, $subject, String::_interpolate($message, $messageArgs), $headers);
    }

}