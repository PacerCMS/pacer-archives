<?php

// Document Root
define('DOCROOT', realpath(dirname(__FILE__) . '/../'));

// Global include files
require DOCROOT . '/config.php';
require DOCROOT . '/includes/class.smarty.php';
require DOCROOT . '/includes/class.database.php';
require DOCROOT . '/includes/functions.php';

// Easily accessible database object
$db = Database::getDatabase();

$Smarty = new SimplePHPSmarty;
if (isset($_GET['debug']) || DEBUG == true):
	$Smarty->debugging = true;
endif;

// Get full issue list for sidebar, grouped by volume.
// $issue_data = Issue::glob('Issue', "SELECT * FROM `issues` ORDER BY `issue_date` ASC ");
foreach($issue_data as $key => $volume_content):
	$volume = (int) $volume_content->volume;
	$issue_date = $key;
	$volumes[$volume][$issue_date] = $volume_content;
endforeach;
$Smarty->assign('volumes', $volumes);

