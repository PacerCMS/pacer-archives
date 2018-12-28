<?php

use GuzzleHttp\Middleware;

class Issue_model extends CI_Model {
	public $issue_date;
	public $issue;
	public $volume;
	public $circulation;

	/**
	 * Get Issues
	 *
	 * @return array
	 */
	public function getIssues() {
		$this->load->database();
		$this->db->reset_query();
		$this->db->order_by('issue_date', 'ASC');
		$query = $this->db->get('issues');
		return $query->result();
	}

	/**
	 * Get Issue
	 *
	 * @param int $issue_id
	 * @return object
	 */
	public function getIssue($issue_id) {
		$this->load->database();
		if ($issue_id) {
			$query = $this->db->get_where('issues', array('issue_date' => $issue_id));
			return $query->row();
		}
	}

	/**
	 * Get Articles
	 */
	public function getArticles($issue) {
		return $this->Article_model->getArticles(array('issue_id' => $issue->issue_date));
	}

	/**
	 * Get Internet Archive Data
	 */
	public function getInternetArchiveData($issue) {		
		if (!is_object($issue) || !is_numeric($issue->volume) || !is_numeric($issue->issue)) {
			return false;
		}
		$client = new GuzzleHttp\Client();
		$response = $client->get('https://archive.org/advancedsearch.php', array(
			'query' => array(
				'output' => 'json',
				'q' => sprintf('collection:(thepacer) date:%s', $issue->issue_date)
			)
		));
		$contents = $response->getBody()->getContents();
		$contents = json_decode($contents);
		if ($contents === false) {
			return false;
		}
		if (property_exists($contents, 'response') && $contents->response->numFound > 0) {
			return array_shift($contents->response->docs);
		}
		else {
			return false;
		}
	}
}
