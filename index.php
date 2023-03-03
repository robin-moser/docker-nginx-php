<!DOCTYPE html>
<html>
	<head>
		<title>robinmoser/nginx-php</title>
		<style>
			html { color-scheme: light dark; overflow: hidden;  }
			body { padding: 3em 3em; font-family: Tahoma,Verdana,Arial,sans-serif; }
			pre  { padding: 3em 0; position: absolute; bottom: 0; border-top: 1px solid }
		</style>
	</head>
	<body>
		<h1>Welcome to nginx/php</h1>
		<p>If you see this page, the web server is successfully running.<br>
		The installed PHP version is: <?= phpversion(); ?></p>
		<pre><?php
			foreach ( apache_request_headers() as $name => $value )
			echo '<em style="color:cadetblue">' . $name . '</em>: ' . $value . "\n";
			?>
		</pre>
	</body>
</html>
