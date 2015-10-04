{extends file='layout.tpl'}
{block name=head}
	<link rel="canonical" href="http://{$smarty.server.SERVER_NAME}/article/{$article->title|@url_title:'-':true}/{$article->article_id}" />
{/block}
{block name=content}

<div class="col-md-8">
	
	<div class="content">

		<h1>{$article->title}</h1>
		<h2><em>{$article->subtitle}</em></h2>

		<hr />
		<p>Published <a href="/issue/{$issue->issue_date}">{$issue->issue_date|date_format:"%B %e, %Y"}</a> <small>Volume {$issue->volume}, Issue {$issue->issue}</small></p>
		<hr />

		{if $article->photo_src ne ''}
		<div class="pull-right" style="width:255px; margin-left:2em;">
			<div style="text-align:center;"><a href="/assets/{$article->photo_src}"><img src="/assets/{$article->photo_src}" alt="Credit: {$article->photo_credit}" title="Caption: {$article->photo_caption}" style="max-width:250px;"/></a></div>
			<blockquote>
			{$article->photo_caption|@auto_typography}
			{if $article->photo_credit ne ''}<small>Credit: {$article->photo_credit}</small>{/if}
			</blockquote>
		</div>
		{/if}

		<p>By <strong>{$article->author_id}{if $article->author_title ne ''}, {$article->author_title}{/if}</strong> {if $article->co_author_id ne ''} and <strong>{$article->co_author_id}{if $article->co_author_title ne ''}, {$article->co_author_title}{/if}</strong>{/if}</p>
		{$article->full_text|@auto_typography}

	</div>

</div>

<div class="col-md-3">
	<!-- Pacer Archives - Right Side -->
	<ins class="adsbygoogle hidden-xs hidden-sm"
		style="display:inline-block;width:160px;height:600px"
		data-ad-client="ca-pub-3896111714575810"
		data-ad-slot="8568980289"></ins>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#volume-{$issue->volume}').show();
});
</script>

{/block}