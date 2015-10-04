<?php

class MY_Controller extends CI_Controller {
  /**
   * Constructor
   */
  public function __construct() {
  	parent::__construct();
  	$issues = $this->Issue_model->getIssues();
  	foreach ($issues as $issue) {
  		$volumes[$issue->volume][] = $issue;
  	}
  	$this->smartyci->assign('volumes', $volumes);
  }
}