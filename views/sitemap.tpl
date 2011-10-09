<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{foreach $issue_list as $issue_item}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/issue/{$issue_item->id}</loc>
		<lastmod>{$issue_item->id}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{/foreach}
	{foreach $article_list as $article_item}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/article/{$article_item->title|@slugify}/{$article_item->id}</loc>
		<lastmod>{$article_item->issue_date}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.5</priority>
	</url>
	{/foreach}
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/search</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/about</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://{$smarty.server.HTTP_HOST}{$smarty.const.WEBROOT}/contact</loc>
		<lastmod>{$smarty.now|date_format:"%Y"}</lastmod>
		<changefreq>monthly</changefreq>
		<priority>0.8</priority>
	</url>
</urlset>