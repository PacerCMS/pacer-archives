<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{if isset($title)}{$title} | {/if}The Pacer (2002-06)</title>
		<meta name="description" content="{if isset($description)}{$description|escape}{/if}">

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

		<link rel="stylesheet" href="{$smarty.const.WEBROOT}/assets/libraries/bootstrap/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="{$smarty.const.WEBROOT}/assets/css/main.css" type="text/css">

		<link rel="shortcut icon" href="{$smarty.const.WEBROOT}/assets/images/favicon.ico">

		{block name=head}{/block}

		{if $smarty.const.DEBUG eq false}
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-635661-27']);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
		{/if}

	</head>

	<body>
		<div class="container">

			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a class="navbar-brand" href="{$smarty.const.WEBROOT}/">The Pacer Archives (2002 - 2006)</a>
					<ul class="nav navbar-nav">
						<li {if $Router->controller eq 'home'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/">Home</a></li>
						<li {if $Router->controller eq 'search'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/search">Search</a></li>
						<li {if $Router->controller eq 'about'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/about">About</a></li>
						<li {if $Router->controller eq 'contact'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/contact">Contact</a></li>
					</ul>
					<p class="pull-right"></p>
				</div>
			</nav>

			<div class="col-md-3">
				<div class="well">
					{block name="sidebar"}

					{foreach $volumes as $volume_number => $issue_data}
					<h5><a href="javascript:void(0);" onclick="$('#volume-{$volume_number}').toggle();">Volume {$volume_number}</a></h5>
					<ul id="volume-{$volume_number}" style="display:none;">
						{foreach $issue_data as $issue_date => $issue_item}
						<li><a href="{$smarty.const.WEBROOT}/issue/{$issue_date}">{$issue_date|date_format:"%D"}</a> Issue {$issue_item->issue}</li>
						{/foreach}
					</ul>
					{/foreach}

					{/block}
				</div>
			</div>

			<div class="content col-md-9">
	
				{block name=content}


				{/block}

			</div>
		</div>

		<div class="container">
			<hr />
			<script type="text/javascript">
			google_ad_client = "ca-pub-3896111714575810";
			/* Pacer Archives - Footer */
			google_ad_slot = "3080849889";
			google_ad_width = 728;
			google_ad_height = 90;
			</script>
			<div style="Width:750px; margin-left:auto; margin-right: auto;">
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> </script>
			</div>
			<hr />
		</div>

		<div class="container">
			<footer>
				<p>The Pacer Archives (2002 - 2006) - <em>Not affiliated with the student newspaper.</em></p>
			</footer>
		</div>

	</body>
</html>