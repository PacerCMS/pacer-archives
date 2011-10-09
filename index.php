<?php
// Root classes
require 'includes/master.inc.php';
require DOCROOT . '/includes/class.routing.php';

$Router = new Router(); // create router instance 
 
$Router->map(WEBROOT . '/', array('controller' => 'home', 'action' => 'index', 'id' => ''));
$Router->map(WEBROOT . '/issue/:slug/:id', array('controller' => 'issue'));
$Router->map(WEBROOT . '/issue/:id', array('controller' => 'issue'));
$Router->map(WEBROOT . '/article/:slug/:id', array('controller' => 'article'));
$Router->map(WEBROOT . '/article/:id', array('controller' => 'article'));
$Router->map(WEBROOT . '/sitemap.xml', array('controller' => 'sitemap', 'id' => ''));

// $Router->map('/logout', array('controller' => 'auth', 'action' => 'logout'));
// $Router->map('/signup', array('controller' => 'auth', 'action' => 'signup'));
// $Router->map('/profile/:action', array('controller' => 'profile')); // will call controller "Profile" with dynamic method ":action()"
// $Router->map('/users/:id', array('controller' => 'users'), array('id' => '[\d]{1,8}')); // define filters for the url parameters

// Run rules
$Router->default_routes();
$Router->execute();

// Give Smarty access to the Router object
$Smarty->assign('Router', $Router);


// Extract controller name
$controller = DOCROOT . '/controllers/' . $Router->controller . '.php';

// Handle a missing controller
if (!file_exists($controller))
	$controller = DOCROOT . '/controllers/404.php';

// Include the requested file
include($controller);
