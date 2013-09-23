{extends file='layout.tpl'}
{block name=content}

<h1>{$this_issue->id|date_format:"%B %e, %Y"} <small>Volume {$this_issue->volume}, Issue {$this_issue->issue}</small></h1>

<hr />

{foreach $articles as $section_name => $section_contents}

<div class="row">

	<div class="col-md-9">
		<h2>{$section_name}</h2>
		<ul>
		{foreach $section_contents as $article}
			<li><a href="{$smarty.const.WEBROOT}/article/{$article->title|@slugify}/{$article->id}">{$article->title}</a> by {$article->author_name}</li>
		{/foreach}
		</ul>
	</div>

	<div class="col-md-3">
		{if isset($issue_images[$section_name])}
		{foreach $issue_images[$section_name] as $i => $image}
		<div><a href="{$smarty.const.WEBROOT}/article/{$image.related_article_title|@slugify}/{$image.related_article_id}"><img src="{$smarty.const.WEBROOT}/assets/{$image.photo_src}" class="thumbnail" width="{if $i eq 0}210{else}90{/if}" alt="{$image.related_article_title}" title="{$image.related_article_title}"></a></div>
		{/foreach}
		{/if}
	</div>

</div>

{/foreach}

<div style="clear:both;"></div>

<script type="text/javascript">$('#volume-{$this_issue->volume}').show();</script>

{/block}