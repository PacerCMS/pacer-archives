<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{if isset($title)}{$title} | {/if}The Pacer (2002-06)</title>
		<meta name="description" content="{if isset($description)}{$description|escape}{/if}">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" href="{$smarty.const.WEBROOT}/assets/css/main.css" type="text/css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

		<link rel="shortcut icon" href="{$smarty.const.WEBROOT}/assets/images/favicon.ico">

		<!-- Google Ad Code -->
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

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

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="{$smarty.const.WEBROOT}/">The Pacer Archives</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li {if $Router->controller eq 'home'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/">Home</a></li>
						<li {if $Router->controller eq 'search'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/search">Search</a></li>
						<li {if $Router->controller eq 'about'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/about">About</a></li>
						<li {if $Router->controller eq 'contact'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/contact">Contact</a></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

		<!-- Pacer Archives - Mobile Ad -->
		<ins class="adsbygoogle hidden-md hidden-lg"
			style="display:inline-block;width:320px;height:100px"
			data-ad-client="ca-pub-3896111714575810"
			data-ad-slot="5948890688"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>

		<div class="container">

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
			<!-- Pacer Archives - Responsive Footer -->
			<ins class="adsbygoogle"
			     style="display:block"
			     data-ad-client="ca-pub-3896111714575810"
			     data-ad-slot="5809289886"
			     data-ad-format="auto"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
			<hr />
		</div>

		<div class="container">
			<footer>
				<p>The Pacer Archives (2002 - 2006) - <em>Not affiliated with the student newspaper.</em></p>
			</footer>
		</div>

	</body>
</html>