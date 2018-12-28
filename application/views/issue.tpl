{extends file='layout.tpl'}
{block name=content}

<h1>{$issue->issue_date|date_format:"%B %e, %Y"} <small>Volume {$issue->volume}, Issue {$issue->issue}</small></h1>

<hr />

{if $archive_issue}
<h2>Press Archive <small><a href="https://archive.org/details/{$archive_issue->identifier}" target="_blank">Open Issue</a></small></h2>
<iframe src="https://archive.org/stream/{$archive_issue->identifier}?ui=embed#mode/2up" width="100%" height="640" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen></iframe>
<hr />
{/if}

{if count($articles) > 0}
{foreach $sections as $section}
{if isset($articles[$section]) and count($articles[$section]) > 0}
<div class="row">

	<div class="col-md-9">
		<h2>{$section}</h2>
		<ul>
		{foreach $articles[$section] as $article}
			<li><a href="/article/{$article->title|@url_title:'-':true}/{$article->article_id}">{$article->title}</a> by {$article->author_id}</li>
		{/foreach}
		</ul>
	</div>

	<div class="col-md-3">
		{if isset($issue_images[$section])}
		{foreach $issue_images[$section] as $i => $image}
		<div><a href="/article/{$image.related_article_title|@url_title:'-':true}/{$image.related_article_id}"><img src="/assets/{$image.photo_src}" class="thumbnail" width="{if $i eq 0}210{else}90{/if}" alt="{$image.related_article_title}" title="{$image.related_article_title}"></a></div>
		{/foreach}
		{/if}
	</div>
</div>
{/if}
{/foreach}
{else}
<p>No articles in this issue.</p>
{/if}

<div style="clear:both;"></div>

<script type="text/javascript">
$(document).ready(function() {
	$('#volume-{$issue->volume}').show();
});
</script>

{/block}
