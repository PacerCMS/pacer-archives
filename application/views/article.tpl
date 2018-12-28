{extends file='layout.tpl'}
{block name=head}
	<link rel="canonical" href="http://{$smarty.server.SERVER_NAME}/article/{$article->title|@url_title:'-':true}/{$article->article_id}" />
{/block}
{block name=content}

<div class="col-md-8" itemscope itemtype="http://schema.org/NewsArticle">
  <header class="header">
    <h1 class="title" itemprop="headline">{$article->title}</h1>
    {if $article->subtitle}<h2><em>{$article->subtitle}</em></h2>{/if}

    <hr />
    <p>Published <a href="/issue/{$issue->issue_date}"><span itemprop="datePublished">{$issue->issue_date|date_format:"%B %e, %Y"}</span></a> <small>(Volume {$issue->volume}, No. {$issue->issue})</small></p>
    <p class="author" itemprop="author" itemscope itemtype="http://schema.org/Person">
      	By <strong itemprop="name">{$article->author_id}</strong>{if $article->author_title ne ''}, {$article->author_title}{/if} {if $article->co_author_id ne ''} and <strong itemprop="name">{$article->co_author_id}</strong>{if $article->co_author_title ne ''}, {$article->co_author_title}{/if}{/if}</p>
     </p>
    <hr />
  </header>

  {if $article->photo_src ne ''}
  <div class="pull-right" style="width:255px; margin-left:2em;">
    <img itemprop="image" src="/assets/{$article->photo_src}" alt="Credit: {$article->photo_credit}">
	<blockquote>
	{$article->photo_caption|@auto_typography}
	{if $article->photo_credit ne ''}<small>Credit: {$article->photo_credit}</small>{/if}
	</blockquote>
  </div>
  {/if}

  <article class="content" itemprop="articleBody">
    {$article->full_text|@auto_typography}
  </article>

</div>

<div class="col-md-3">

</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#volume-{$issue->volume}').show();
});
</script>

{/block}
