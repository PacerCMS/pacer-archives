<?php

class Front extends MY_Controller {
	/**
	 * Index
	 */
	public function index() {
		$this->smartyci->assign('description', '2002-06 archives of The Pacer, the student newspaper of the University of Tennessee at Martin.');
		$this->smartyci->display('home.tpl');
	}

	/**
	 * About
	 */
	public function about() {
		$this->smartyci->assign('description', 'About this project.');
		$this->smartyci->display('about.tpl');
	}

	/**
	 * Contact
	 */
	public function contact() {
		$this->smartyci->assign('description', 'Contact the Pacer Archives project manager.');
		$this->smartyci->display('contact.tpl');
	}
}
