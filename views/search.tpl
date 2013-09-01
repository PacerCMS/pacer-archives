{extends file='layout.tpl'}
{block name=content}

<div class="col-md-12">

	<div class="content">
		<h1>Search the Archives</h1>
		<form method="get" class="form-horizontal">
			<fieldset>
				<legend>Enter your search criteria</legend>
				<div class="form-group">
					<label class="col-lg-2 control-label">Keyword/Phrase</label>
					<div class="col-lg-10">
						<input class="form-control" type="search" class="" name="q" id="q" value="{if isset($smarty.get.q)}{$smarty.get.q|htmlentities}{/if}" />
						<span class="help-block">Case insensitive, but only matches whole words / phrases</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Where</label>
					<div class="col-lg-10">
						<select class="form-control" name="index" id="index">
							<option value="full_text" {if isset($smarty.get.index) && $smarty.get.index eq 'full_text'} selected="selected"{/if}>Article Text</option>
							<option value="author_names" {if isset($smarty.get.index) && $smarty.get.index eq 'author_names'} selected="selected"{/if}>Author Names</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" value="Search" class="btn btn-primary">
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	
	{if isset($search_results)}
	{if count($search_results) gt 0}

	<hr />
	
	<div>
		<ul class="pagination">
		{$Pager->advanced()}
		</ul>
	</div>
	
	<table class="table table-bordered table-striped">
		<thead>
		<tr>
			<th>Title</th>
			<th>Primary Author</th>
			<th>Date</th>
			<th>Section</th>
		</tr>
		</thead>
		<tbody>
		{foreach $search_results as $article}
		<tr>
			<td><a href="{$smarty.const.WEBROOT}/article/{$article->title|@slugify}/{$article->id}">{$article->title}</td>
			<td>{$article->author_name}</td>
			<td>{$article->issue_date|date_format}</td>
			<td>{$article->section_name}</td>
		</tr>
		{/foreach}
		</tbody>
	</table>

	<div>
		<ul class="pagination">
		{$Pager->advanced()}
		</ul>
	</div>
	
	{else}
		<h5>No articles matched your search criteria.</h5>
	{/if}
	{/if}
	
</div>

<div style="clear:both;"></div>

{/block}