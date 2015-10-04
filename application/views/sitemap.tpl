<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{foreach $issue_list as $issue_item}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/issue/{$issue_item->issue_date}</loc>
		<lastmod>{$issue_item->issue_date}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{/foreach}
	{foreach $article_list as $article_item}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/article/{$article_item->title|@convert_accented_characters|@url_title:'-':true}/{$article_item->article_id}</loc>
		<lastmod>{$article_item->issue_id}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{/foreach}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/search</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/about</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}/contact</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
</urlset>