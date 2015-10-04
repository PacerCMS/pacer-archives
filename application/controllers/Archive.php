<?php

class Archive extends MY_Controller {
	/**
	 * Issue
	 */
	public function view_issue($issue_date) {
		$this->smartyci->assign('issue_date', $issue_date);

		/* Issue Data */
		$issue = $this->Issue_model->getIssue($issue_date);
		if (!is_object($issue) || !$issue->issue_date) {
			show_404();
		}
		$this->smartyci->assign('issue', $issue);
		$this->smartyci->assign('title', sprintf('%s - Volume %d, Issue %d', date('F j, Y', strtotime($issue_date)), $issue->volume, $issue->issue) );

		/* Section Data */
		$sections = array(
			'Cover',
			'Opinions',
			'News',
			'Features',
			'Sports',
			'Technology',
			'Election'
		);
		$this->smartyci->assign('sections', $sections);

		/* Article Data */
		$issue_images = array();
		$article_list = array();
		$articles = array();
		$article_list = $this->Issue_model->getArticles($issue);
		foreach ($article_list as $row){
			// Articles
			$articles[$row->section_id][] = $row;

			// Related media
			if ($row->photo_src) {
				$issue_images[$row->section_id][] = array(
					'photo_src' => $row->photo_src,
					'photo_caption' => $row->photo_caption,
					'photo_credit' => $row->photo_credit,
					'related_article_id' => $row->article_id,
					'related_article_title' => $row->title
				);
			}
		}
		$this->smartyci->assign('articles', $articles);
		$this->smartyci->assign('issue_images', $issue_images);
		$this->smartyci->assign('description', sprintf('Articles from The Pacer, %s - Volume %d, Issue %d', date('F j, Y', strtotime($issue->issue_date)), $issue->volume, $issue->issue));

		$this->smartyci->assign('archive_issue', $this->Issue_model->getInternetArchiveData($issue));

		// Render template
		$this->smartyci->display('issue.tpl', $issue_date);
	}

	/**
	 * View
	 */
	public function view_article($_slug, $article_id) {
		$this->smartyci->assign('article_id', $article_id);

		/* Article Data */
		$article = $this->Article_model->getArticle($article_id);
		if (!is_object($article) || !$article->article_id):
			show_404();
		endif;

		$this->smartyci->assign('article', $article);
		$this->smartyci->assign('title', $article->title . ' | ' . date('n/j/Y', strtotime($article->issue_id)));
		$this->smartyci->assign('description', date('n/j/Y', strtotime($article->issue_id)) . ' -- ' . trim(str_replace(array("\n","\r",'  '), ' ', $article->summary)));

		/* Issue Data */
		$this->smartyci->assign('issue', $this->Article_model->getIssue($article));

		// Render template
		$this->smartyci->display('article.tpl', $article_id);
	}

	/**
	 * Site Map
	 */
	public function sitemap() {
		// Cannot use debugger
		$this->smartyci->debugging = false;

		// Issues
		$issue_list = $this->Issue_model->getIssues();
		$this->smartyci->assign('issue_list', $issue_list);

		// Articles
		$article_list = $this->Article_model->getArticles(array());
		$this->smartyci->assign('article_list', $article_list);


		header('Content-type: application/xml');
		$this->smartyci->display('sitemap.tpl');
	}

	/**
	 * Search
	 */
	public function search() {
		$this->smartyci->caching = 0;
		$this->smartyci->assign('description', 'Search article text and authors.');
		$this->smartyci->assign('search_index', $this->input->get('index'));

		$results = $this->Article_model->search(
			$this->input->get('q'),
			$this->input->get('index'),
			250
		);
		$this->smartyci->assign('search_results', $results);

		if ($this->input->get('format') == 'json') {
			$this->smartyci->debugging = false;
			header('Content-type: application/json');
			print json_encode($results);
		}
		else {
			$this->smartyci->display('search.tpl', json_encode($this->input->get()));
		}
	}

}
