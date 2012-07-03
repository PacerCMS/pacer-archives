<?php

/* Routing */
$article_id = $Router->id;
$Smarty->assign('article_id', $article_id);

/* Article Data */
$article = new Article($article_id);
if (!$article->id):
	header("HTTP/1.0 404 Not Found");
	$Smarty->display('404.tpl');
	exit;
endif;

$Smarty->assign('article', $article);
$Smarty->assign('title', $article->title);
$Smarty->assign('description', trim(str_replace(array("\n","\r",'  '), ' ', $article->summary)) );

/* Issue Data */
$this_issue = new Issue($article->issue_date);
$Smarty->assign('this_issue', $this_issue);

// Render template
$Smarty->display('article.tpl');