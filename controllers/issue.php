<?php

/* Routing */
$issue_date = $Router->id;
$Smarty->assign('issue_date', $issue_date);

/* Issue Data */
$this_issue = new Issue($issue_date);
$Smarty->assign('this_issue', $this_issue);
$Smarty->assign('title', sprintf('%s - Volume %d, Issue %d', date('F j, Y', strtotime($issue_date)), $this_issue->volume, $this_issue->issue) );

/* Article Data */
$issue_images = array();
$article_list = array();
$article_list = Article::glob('Article', sprintf("SELECT * FROM `articles` WHERE `issue_date` = %s ORDER BY `section_name` ASC, `priority` ASC ", $db->quote($issue_date) ));
foreach ($article_list as $row):

	// Articles
	$section_name = $row->section_name;
	$articles[$section_name][] = $row;

	// Related media
	$section = $row->section_name;
	$photo_src = $row->photo_src;
	$photo_caption = $row->photo_caption;
	$photo_credit = $row->photo_credit;
	$related_article_id = $row->id;
	$related_article_title = $row->title;

	if (!$photo_src) {
		continue;
	}

	$issue_images[$section][] = array(
		'photo_src' => $photo_src,
		'photo_caption' => $photo_caption,
		'photo_credit' => $photo_credit,
		'related_article_id' => $related_article_id,
		'related_article_title' => $related_article_title
	);

endforeach;
$Smarty->assign('articles', $articles);
$Smarty->assign('issue_images', $issue_images);
$Smarty->assign('description', sprintf('%s - Volume %d, Issue %d', date('F j, Y', strtotime($issue_date)), $this_issue->volume, $this_issue->issue));

// Render template
$Smarty->display('issue.tpl');