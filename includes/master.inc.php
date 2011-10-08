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