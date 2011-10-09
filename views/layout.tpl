<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{if isset($title)}{$title} | {/if}The Pacer Archives (2002 - 2006)</title>
		<meta name="description" content="{if isset($description)}{$description|escape}{/if}">

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

		<link rel="stylesheet" href="{$smarty.const.WEBROOT}/lib/bootstrap/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="{$smarty.const.WEBROOT}/assets/css/main.css" type="text/css">

		<link rel="shortcut icon" href="{$smarty.const.WEBROOT}/assets/images/favicon.ico">

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

		<div class="topbar">
			<div class="topbar-inner">
				<div class="container-fluid">
					<a class="brand" href="{$smarty.const.WEBROOT}/">The Pacer Archives (2002 - 2006)</a>
					<ul class="nav">
						<li {if $Router->controller eq 'home'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/">Home</a></li>
						<li {if $Router->controller eq 'search'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/search">Search</a></li>
						<li {if $Router->controller eq 'about'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/about">About</a></li>
						<li {if $Router->controller eq 'contact'}class="active"{/if}><a href="{$smarty.const.WEBROOT}/contact">Contact</a></li>
					</ul>
					<p class="pull-right"></p>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="sidebar">
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
			<div class="content">
	
				{block name=content}
	
				<!-- Main hero unit for a primary marketing message or call to action -->
				<div class="hero-unit">
					<h1>Hello, world!</h1>
					<p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
					<p><a class="btn primary large">Learn more &raquo;</a></p>
				</div>

				<!-- Example row of columns -->
				<div class="row">
					<div class="span6">
						<h2>Heading</h2>
						<p>Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
					</div>
					<div class="span5">
						<h2>Heading</h2>
						 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
				 </div>
					<div class="span5">
						<h2>Heading</h2>
						<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
					</div>
				</div>

				<hr>

				<!-- Example row of columns -->
				<div class="row">
					<div class="span6">
						<h2>Heading</h2>
						<p>Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
					</div>
					<div class="span5">
						<h2>Heading</h2>
						 <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
				 </div>
					<div class="span5">
						<h2>Heading</h2>
						<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
						<p><a class="btn" href="#">View details &raquo;</a></p>
					</div>
				</div>

				{/block}

				<footer>
					<p>The Pacer Archives (2002 - 2006) - <em>Not affiliated with the student newspaper.</em></p>
				</footer>
			</div>
		</div>

	</body>
</html>