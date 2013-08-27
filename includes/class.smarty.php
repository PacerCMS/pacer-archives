<?php

require_once DOCROOT . '/lib/Smarty3/Smarty.class.php';

class SimplePHPSmarty extends Smarty {
	
	function __construct() {
    parent::__construct();
		$this->setTemplateDir(DOCROOT . '/views');
		$this->setCompileDir(DOCROOT . '/cache/smarty');
		$this->setCacheDir(DOCROOT . '/cache/smarty');
		$this->setConfigDir(DOCROOT . '/views/config');
	}

}
