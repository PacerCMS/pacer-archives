{extends file='layout.tpl'}
{block name=content}

<div class="span12">

	<div class="content">
		<h1>Search</h1>
		<form method="get">
			<fieldset>
				<div class="clearfix">
					<label>Search</label>
					<div class="input">
						<input type="search" class="" name="q" id="q" value="{if isset($smarty.get.q)}{$smarty.get.q|htmlentities}{/if}" />
						<span class="help-inline">Case insensitive, but only matches whole words / phrases</span>
					</div>
				</div>
				<div class="clearfix">
					<label>Where</label>
					<div class="input">
						<select name="index" id="index">
							<option value="full_text" {if isset($smarty.get.index) && $smarty.get.index eq 'full_text'} selected="selected"{/if}>Article Text</option>
							<option value="author_names" {if isset($smarty.get.index) && $smarty.get.index eq 'author_names'} selected="selected"{/if}>Author Names</option>
						</select>
					</div>
				</div>
				<div class="actions">
					<input type="submit" value="Search" class="btn primary">
				</div>
			</fieldset>
		</form>
	</div>
	
	{if isset($search_results)}
	{if count($search_results) gt 0}
	<h4>Search Results</h4>
	
	<div class="pagination"><ul>{$Pager->advanced()}</ul></div>
	
	<table class="zebra-striped">
		<tr>
			<th>Title</th>
			<th>Primary Author</th>
			<th>Date</th>
			<th>Section</th>
	{foreach $search_results as $article}
		<tr>
			<td><a href="{$smarty.const.WEBROOT}/article/{$article->title|@slugify}/{$article->id}">{$article->title}</td>
			<td>{$article->author_name}</td>
			<td>{$article->issue_date|date_format}</td>
			<td>{$article->section_name}</td>
		</tr>
	{/foreach}
	</table>

	<div class="pagination"><ul>{$Pager->advanced()}</ul></div>
	
	<!-- <div class="pagination">
		<ul>
			<li class="prev disabled"><a href="{}?offset=#">&larr; Previous</a></li>
			<li class="next"><a href="?offset=#">Next &rarr;</a></li>
		</ul>
	</div> -->
	
	{else}
		<h5>No articles matched your search criteria.</h5>
	{/if}
	{/if}
	
</div>

<div style="clear:both;"></div>

{/block}