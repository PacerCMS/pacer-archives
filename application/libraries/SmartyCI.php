<?php

require './vendor/autoload.php';

class Smartyci extends Smarty
{
    public function __construct()
    {
        parent::__construct();

        $config =& get_config();

        $this->caching = 1;
        $this->debugging = 1;
        $this->setTemplateDir( APPPATH . 'views' );
        $this->setCompileDir( APPPATH . 'cache/smarty_c' );
        $this->setConfigDir( APPPATH . 'config/smarty' );
        $this->setCacheDir( APPPATH . 'cache' );
    }

    //if specified template is cached then display template and exit, otherwise, do nothing.
    public function useCached( $tpl, $cacheId = null )
    {
        if ( $this->isCached( $tpl, $cacheId ) )
        {
            $this->display( $tpl, $cacheId );
            exit();
        }
    }
}