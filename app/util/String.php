<?php

namespace util;

class String {

    public static function urlSlug($str, $replace=array(), $delimiter='-', $maxLength=200)
    {

        if( !empty($replace) ) {
            $str = str_replace((array)$replace, ' ', $str);
        }

        $slug = iconv('UTF-8', 'ASCII//TRANSLIT', $str);
        $slug = preg_replace("%[^-/+|\w ]%", '', $slug);
        $slug = strtolower(trim(substr($slug, 0, $maxLength), '-'));
        $slug = preg_replace("/[\/_|+ -]+/", $delimiter, $slug);

        return $slug;
    }

    /**
     * Interpolates context values into the message placeholders.
     */
    public static function _interpolate($message, array $context = array())
    {
        // build a replacement array with braces around the context keys
        $replace = array();
        $message = (string) $message;

        foreach ($context as $key => $val) {
            $replace['{' . $key . '}'] = $val;
        }

        // interpolate replacement values into the message and return
        return strtr($message, $replace);
    }

}