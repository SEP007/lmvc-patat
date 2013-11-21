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

}