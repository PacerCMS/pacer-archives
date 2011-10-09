<?php
// Cannot use debugger
$Smarty->debugging = false;

// Issues
$issue_list = Issue::glob('Issue', "SELECT * FROM `issues` ORDER BY `issue_date` DESC ");
$Smarty->assign('issue_list', $issue_list);

// Articles
$article_list = Article::glob('Article', "SELECT * FROM `articles` ORDER BY `issue_date` DESC ");
$Smarty->assign('article_list', $article_list);


header('Content-type: application/xml');
$Smarty->display('sitemap.tpl');