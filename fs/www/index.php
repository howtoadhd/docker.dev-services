<!DOCTYPE html>
<html>
<head>
    <title>How To ADHD Dev Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/markdown.css">
</head>
<body class="markdown-body">
<h1>How To ADHD Dev Dashboard</h1>

<h2>MySQL (MariaDB)</h2>
<ul>
    <li>Port: <code>3306</code></li>
    <li>Dashboard: <a href="database-admin/">phpMyAdmin</a></li>
</ul>

<h2>Memcached</h2>
<ul>
    <li>Port: <code>11211</code></li>
    <li>Dashboard: <a href="memcached-admin/">phpMemcachedAdmin</a></li>
</ul>

<h2>SES</h2>
<ul>
    <li>Endpoints: <code>ses.aws.<?php echo getenv( 'ROOT_DOMAIN' ); ?></code></li>
</ul>

<h2>S3</h2>
<ul>
    <li>Endpoints:<code>BUCKET_NAME.s3.aws.<?php echo getenv( 'ROOT_DOMAIN' ); ?></code> <code>s3.aws.<?php echo getenv( 'ROOT_DOMAIN' ); ?>/BUCKET_NAME</code></li>
</ul>
</body>
</html>
