<?PHP
	// The Pager class handles the (basic) display and logic for creating the paging HTML often found
	// on a search results page or any record set that is broken up across multiple pages.
	// Can output either a simple "Page 2 of 5" style message or a more complex " << 1 2 3 [4] 5 6 7 >>" one.
	
	class Pager
	{
		// Insert [#] for page number placeholder
		public $link = "index.php?page=[#]";

		public $perPage = 10; // Number of items per page
		public $numPages; // ceil($count / $perPage)

		// Prev/Next HTML when *not* linked
		public $prevMark = "&#171; Previous";
		public $nextMark = "Next &#187;";

		// Prev/Next HTML when linked
		public $prevMarkLinked = "&#171; Previous";
		public $nextMarkLinked = "Next &#187;";

		// Number of pages to show to left and right of current
		public $radius    = 10; 

		// Tag to wrap page numbers with (advanced mode only)
		// Use a complete tag such as "<span>" not just "span".
		// This lets you do stuff like "<span class='foo'>"
		public $wrapTag = "";

		// HTML between page numbers (advanced mode only)
		public $seperator = "";

		// You typically don't need to modify these
		public $prev;
		public $cur;
		public $next;
		public $count; // Total number of items (not pages!)

		function __construct($cur, $count, $link = null, $per_page = null)
		{
			$this->cur = $cur;
			if(is_numeric($count)) $this->count  = $count;
			if(is_array($count)) $this->count    = count($count);
			if(is_resource($count)) $this->count = mysql_num_rows($count);

			if(!is_null($link)) $this->link        = $link;
			if(!is_null($per_page)) $this->perPage = $per_page;

		}

		// If you set any variables after create the Pager object,
		// you can call this function to redo the math.
		function calculate()
		{
			$this->numPages = ceil($this->count / $this->perPage);
			if($this->numPages < 1) $this->numPages = 1;

			if($this->cur < 1) $this->cur = 1;
			if($this->cur > $this->numPages) $this->cur = $this->numPages;
			
			if($this->cur == 1)
			{
				$this->prev = 1;
				$this->next = ($this->numPages > 1) ? 2 : 1;
			}
			elseif($this->cur == $this->numPages)
			{
				$this->prev = $this->cur - 1;
				$this->next = $this->numPages;
			}
			else
			{
				$this->prev = $this->cur - 1;
				$this->next = $this->cur + 1;
			}
		}

		function showtest($idx)
		{
			if ($idx < (($this->cur-1)*$this->perPage) || $idx >= ($this->cur*$this->perPage))
				return false;
			return true;
		}
		
		function simple()
		{
			$this->calculate();
			
			if($this->cur == 1 && $this->numPages == 1)
				return "{$this->prevMark} Page 1 of 1 {$this->nextMark}";
			elseif($this->cur == 1 && $this->numPages > 1)
			{
				$href = $this->makeLink($this->next);
				return "<span class='pager_prev'>{$this->prevMark}</span> Page 1 of {$this->numPages} <a href='$href' class='pager_next'>{$this->nextMarkLinked}</a>";
			}
			elseif($this->cur == $this->numPages)
			{
				$href = $this->makeLink($this->prev);
				return "<a href='$href' class='pager_prev'>{$this->prevMarkLinked}</a> Page {$this->cur} of {$this->numPages} <span class='pager_next'>{$this->nextMark}</span>";
			}
			else
			{
				$href_prev = $this->makeLink($this->prev);
				$href_next = $this->makeLink($this->next);
				return "<a href='$href_prev' class='pager_prev'>{$this->prevMarkLinked}</a> Page {$this->cur} of {$this->numPages} <a href='$href_next' class='pager_next'>{$this->nextMarkLinked}</a>";
			}
		}
		
		function stupid()
		{
			$this->calculate();
			
			if($this->cur == 1)
			{
				$href = $this->makeLink($this->next);
				return "<span class='pager_prev'>{$this->prevMark}</span> &nbsp; <a href='$href' class='pager_next'>{$this->nextMarkLinked}</a>";
			}
			else
			{
				$href_prev = $this->makeLink($this->prev);
				$href_next = $this->makeLink($this->next);
				return "<a href='$href_prev' class='pager_prev'>{$this->prevMarkLinked}</a> &nbsp; <a href='$href_next' class='pager_next'>{$this->nextMarkLinked}</a>";
			}
			
		}
		function advanced()
		{
			$this->calculate();
			
			$start = $this->cur - $this->radius;
			if($start < 1) $start = 1;

			$stop = $this->cur + $this->radius;
			if($stop > $this->numPages) $stop = $this->numPages;

			if(preg_match('@<([a-zA-Z]+)@', $this->wrapTag, $matches) == 1)
			{
				$opening_tag = $this->wrapTag;
				$closing_tag = "</{$matches[1]}>";
			}
			else
			{
				$opening_tag = "";
				$closing_tag = "";
			}

			$numbers = array();
			for($i = $start; $i <= $stop; $i++)
			{
				$href = $this->makeLink($i);
			
				if($i == $this->cur)
					$numbers[] = "$opening_tag<a href='$href' class='pager_number pager_current'>$i</a>$closing_tag";
				else
					$numbers[] = "$opening_tag<a href='$href' class='pager_number'>$i</a>$closing_tag";
			}
		
			$numbers = implode($this->seperator, $numbers);

			if($this->cur == 1 && $this->numPages == 1)
				return "<span class='pager_left pager_disabled'>Previous</span> $numbers <span class='pager_right pager_disabled'>Next</span>";
			elseif($this->cur == 1 && $this->numPages > 1)
			{
				$href = $this->makeLink($this->next);
				return "<span class='pager_left pager_disabled'>Previous</span> $numbers <a href='$href' class='pager_right'>Next</a>";
			}
			elseif($this->cur == $this->numPages)
			{
				$href = $this->makeLink($this->prev);
				return "<a href='$href' class='pager_left'>Previous</a> $numbers <span class='pager_right pager_disabled'>Next</span>";
			}
			else
			{
				$href_prev = $this->makeLink($this->prev);
				$href_next = $this->makeLink($this->next);
				return "<a href='$href_prev' class='pager_left'>Previous</a> $numbers <a href='$href_next' class='pager_right'>Next</a>";
			}
		}

		function resultCount()
		{
			$start = (1 + (($this->cur-1) * $this->perPage));
			$end = $start + $this->perPage - 1;
			if ($end > $this->count) { $end = $this->count; }
			if ($this->count==0) { $start=0; $end=0; }
			$str .= "<strong>$start &ndash; $end</strong>";
			$str .= " of ";
			$str .= "<strong>{$this->count}</strong>";
			return $str;
		}
		
		function makeLink($page_num)
		{
			return str_replace("[#]", $page_num, $this->link);
		}
		
		function limit()
		{
			$offset = $this->getOffset();
			$this->perPage = intval($this->perPage);

			if ($this->perPage > 0) {
				return " limit $offset, {$this->perPage}";
			}

                        return " limit $offset, 100";
		}
		
		function getOffset()
		{
			return ($this->cur-1) * $this->perPage;
		}
		
	}
?>