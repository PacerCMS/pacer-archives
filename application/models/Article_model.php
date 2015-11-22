<?php

class Article_model extends CI_Model {
	public $article_id = 0;
	public $issue_id = '';
	public $section_id = '';
	public $author_id = '';
	public $co_author_id = '';
	public $author_title = '';
	public $co_author_title = '';
	public $title = '';
	public $subtitle = '';
	public $summary = '';
	public $full_text = '';
	public $photo_src = '';
	public $photo_align = '';
	public $photo_border = '';
	public $priority = '';
	public $photo_credit = '';
	public $photo_caption = '';
	public $keywords = '';
	public $last_edited = '';

	public $slug;

	/**
	 * Get Article
	 *
	 * @param int $article_id
	 * @return object
	 */
	public function getArticle($article_id) {
		$this->load->database();
		$this->db->reset_query();
		if ($article_id) {
			$query = $this->db->get_where('articles', array('article_id' => $article_id));
			$article = $query->row();
			if ($article) {
				$article->slug = strtolower(url_title($article->title));
			}
			return $article;
		}
	}

	/**
	 * Get Articles
	 */
	public function getArticles($filters) {
		$this->db->reset_query();
		$this->db->order_by('priority', 'ASC');
		$query = $this->db->get_where('articles', $filters);
		return $query->result();
	} 

	/**
	 * Get Issue
	 */
	public function getIssue($article) {
		return $this->Issue_model->getIssue($article->issue_id);
	}

	/**
	 * Search
	 *
	 * @param string $query
	 * @param string $index
	 * @param int $limit
	 * @param array
	 */
	public function search($search_query, $index='full_text', $limit=250) {
		$results = array();
		if ($search_query) {
			switch ($index) {
				case 'author_names':
					$query = $this->db->query(
						'SELECT * FROM articles WHERE (lower(`author_id`) LIKE lower(?)) OR (lower(`co_author_id`) LIKE lower(?)) ORDER BY issue_id DESC LIMIT ?',
						array(
							'%' . $search_query . '%',
							'%' . $search_query . '%',
							$limit
						)
					);
					break;
				case 'full_text':
				default:
					$query = $this->db->query(
						'SELECT * FROM articles WHERE MATCH (`title`,`full_text`,`keywords`,`author_id`,`co_author_id`) AGAINST (?) > 0 LIMIT ?',
						array(
							$search_query,
							$limit
						)
					);
					break;
			}
			return $query->result();
		}
	}

}
