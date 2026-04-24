<!DOCTYPE html>
<html>
	<head>
		<title>robinmoser/nginx-php</title>
		<style>
			html {
				color-scheme: light dark;
			}
			body {
				margin: 0;
				padding: 3rem;
				min-height: 100vh;
				box-sizing: border-box;
				display: flex;
				flex-direction: column;
				gap: 1.5rem;
				font-family: Tahoma, Verdana, Arial, sans-serif;
			}
			h1, p {
				margin: 0;
			}
			pre {
				margin: auto 0 0;
				padding-top: 1.5rem;
				border-top: 1px solid;
				white-space: pre-wrap;
				word-break: break-word;
			}
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
