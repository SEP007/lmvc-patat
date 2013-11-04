<?php

use troba\EQM\EQM;
use Scandio\lmvc\LVC;
use Scandio\lmvc\modules\assetpipeline;
use Scandio\lmvc\modules\upload;
use Scandio\lmvc\modules\i18n;

class Bootstrap extends \Scandio\lmvc\Bootstrap
{
    public function initialize()
    {
        EQM::initialize([
            'dsn' => LVC::get()->config->dsn,
            'username' => LVC::get()->config->username,
            'password' => LVC::get()->config->password
        ]);

        ui\UI::registerSnippetDirectory(static::getPath() . '/ui/snippets/');

        upload\Bootstrap::configure([
            'root'              => static::getPath(),
            'uploadDirectory'   => 'img/uploads'
        ]);

        assetpipeline\Bootstrap::configure(static::getPath());
		i18n\Bootstrap::configure(static::getPath());
    }
}