<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{if isset($title)}{$title} | {/if}The Pacer (2002-06)</title>
		<meta name="description" content="{if isset($description)}{$description|escape}{/if}">

		<link rel="shortcut icon" href="/assets/images/favicon.ico">

		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="/assets/css/main.css" type="text/css">

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
					<a class="navbar-brand" href="/">The Pacer Archives</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li {if false eq 'home'}class="active"{/if}><a href="/">Home</a></li>
						<li {if false eq 'search'}class="active"{/if}><a href="/search">Search</a></li>
						<li {if false eq 'about'}class="active"{/if}><a href="/about">About</a></li>
						<li {if false eq 'contact'}class="active"{/if}><a href="/contact">Contact</a></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>

		<div class="container">
			<div class="col-md-3">
				<div class="well">
					{block name="sidebar"}

					{foreach $volumes as $volume_number => $issue_data}
					<h5><a href="javascript:void(0);" onclick="$('#volume-{$volume_number}').toggle();">Volume {$volume_number}</a></h5>
					<ul id="volume-{$volume_number}" style="display:none;">
						{foreach $issue_data as $issue_item}
						<li><a href="/issue/{$issue_item->issue_date}">{$issue_item->issue_date|date_format:"%D"}</a> Issue {$issue_item->issue}</li>
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
			<footer>
				<p>The Pacer Archives (2002 - 2006) - <em>Not affiliated with the student newspaper.</em></p>
			</footer>
		</div>

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	</body>
</html>
