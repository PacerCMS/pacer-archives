<?php

require DOCROOT . '/lib/dbobject/init.php';

class Article extends DBObject
{
		public function __construct($id = null) {

			// Configuration (overloaded)
			$table_name = 'articles';
			$columns = array('article_id', 'title', 'subtitle', 'summary', 'full_text', 'issue_date', 'section_name', 'author_name', 'author_title', 'co_author_name', 'co_author_title', 'photo_src', 'photo_credit', 'photo_caption', 'keywords', 'priority', 'update_ts', 'update_user');
			$id_column = 'article_id';

			// No configuration beyond this point
			$this->className	= get_class($this);
			$this->tableName	= $table_name;
			$this->idColumnName = $id_column;

			foreach($columns as $col)
				$this->columns[$col] = null;

			if(!is_null($id))
				$this->select($id);
		}
}

class Issue extends DBObject
{
		public function __construct($id = null) {

			// Configuration (overloaded)
			$table_name = 'issues';
			$columns = array('issue_date', 'issue', 'volume', 'circulation');
			$id_column = 'issue_date';

			// No configuration beyond this point
			$this->className	= get_class($this);
			$this->tableName	= $table_name;
			$this->idColumnName = $id_column;

			foreach($columns as $col)
				$this->columns[$col] = null;

			if(!is_null($id))
				$this->select($id);
		}
}