<?php

require DOCROOT . '/includes/class.pager.php';

if (isset($_GET['q'])):

	// Select an index
	if (isset($_GET['index'])):
		$index_q = $_GET['index'];
		$index_array = array();
		$index_array['full_text'] = '`full_text`';
		$index_array['author_names'] = 'concat(`author_name`,`co_author_name`)';
		
		// Only allow certain columns to be indexed
		if (isset($index_array[$index_q]))
			$index = $index_array[$index_q];
		else
			$index = '`full_text`';
		
	else:
		$index = '`full_text`';
	endif;

	// Declare search terms
	$search = $db->quote('%' . $_GET['q'] . '%');

	// Run search
	$search_query = "SELECT * FROM `articles` WHERE lower({$index}) LIKE lower({$search}) ORDER BY `issue_date` DESC, `section_name` ASC, `priority` ASC ";
	$search_result_count = Article::glob('Article', $search_query);
	
	// $Pager = new Pager($cur, $count, $link, $per_page);
	$page_link = WEBROOT . '/search/?q=' . urlencode( $_GET['q']) . '&amp;index=' . urlencode($index_q) .'&amp;page=[#]';
	$page = (isset($_GET['page'])) ? (int) $_GET['page'] : 1;
	$Pager = new Pager($page, count($search_result_count), $page_link, 25 );
	$Pager->wrapTag = '<li>';
	$Smarty->assign('Pager', $Pager);
	
	$offset = ($Pager->getOffset() > -1) ? $Pager->getOffset() : 0;
	$search_results = Article::glob('Article', $search_query . sprintf(' LIMIT %d OFFSET %d', 25, $offset) );
	$Smarty->assign('search_results', $search_results);
	
	// Build pager
	if (isset($_GET['page']))
		$page = (int) $_GET['page'];
	else
		$page = 1;

endif;

$Smarty->display('search.tpl');