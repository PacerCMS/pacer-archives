{extends file='layout.tpl'}
{block name=content}

<div class="col-md-8">
	
	<div class="content">

		<h1>{$article->title}</h1>
		<h2><em>{$article->subtitle}</em></h2>

		<hr />
		<p>Published <a href="{$smarty.const.WEBROOT}/issue/{$this_issue->id}">{$this_issue->id|date_format:"%B %e, %Y"}</a> <small>Volume {$this_issue->volume}, Issue {$this_issue->issue}</small></p>
		<hr />

		{if $article->photo_src ne ''}
		<div class="pull-right" style="width:255px; margin-left:2em;">
			<ul class="media-grid">
				<li style="text-align:center;"><a><img src="{$smarty.const.WEBROOT}/assets/{$article->photo_src}" alt="{$article->photo_credit}" style="max-width:250px;"/></a></ul>
			</ul>
			<blockquote>
			<p>{$article->photo_caption|nl2br}</p>
			{if $article->photo_credit ne ''}<small>Credit: {$article->photo_credit}</small>{/if}
			</blockquote>
		</div>
		{/if}

		<p>By <strong>{$article->author_name}{if $article->author_title ne ''}, {$article->author_title}{/if}</strong> {if $article->co_author_name ne ''} and <strong>{$article->co_author_name}{if $article->co_author_title ne ''}, {$article->co_author_title}{/if}</strong>{/if}</p>
		{$article->full_text|nl2br}

	</div>

</div>

<div style="clear:both;"></div>

<script type="text/javascript">$('#volume-{$this_issue->volume}').show();</script>

{/block}