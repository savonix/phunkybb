<?php

ini_set('display_errors',true);
error_reporting(E_ALL ^ E_NOTICE);

// MSIE won't work with application/xhtml+xml
if(strstr($_SERVER['HTTP_USER_AGENT'],'MSIE')) {
    ini_set('default_mimetype','text/html');
} else {
    ini_set('default_mimetype','application/xhtml+xml');
}
//


// Where is nexista? This path should be to a folder containing nexista
// This is the only thing you may need to edit:
if(file_exists('../nexista/')) {
    define('NX_PATH_BASE', '../nexista/');
}
if (file_exists('../../nexista/')) {
    define('NX_PATH_BASE', '../../nexista/');
}
// Very bad hack
if($_SERVER['HTTP_HOST']=='192.168.8.91') {
    $site_id=2;
} elseif($_SERVER['HTTP_HOST']=='dev-91-gl.savonix.com') {
    $site_id=1;
}
/*
RewriteCond %{REQUEST_URI} ^/a/dev/phunkybb/
RewriteCond %{REQUEST_URI} !/a/dev/phunkybb/index.php|.css|.jpg|.png|.js
RewriteRule ^/a/dev/phunkybb/(\w+)/$ /a/dev/phunkybb/index.php?nxrw_path=/a/dev/phunkybb/index.php&nid=forum&forum_basename=$1 [L]

RewriteCond %{REQUEST_URI} ^/a/dev/phunkybb/
RewriteCond %{REQUEST_URI} !/a/dev/phunkybb/index.php|.css|.jpg|.png|.js
RewriteRule ^/a/dev/phunkybb/(\w+)/(\w+)/ /a/dev/phunkybb/index.php?nxrw_path=/a/dev/phunkybb/index.php&nid=topic&forum_basename=$1&basename=$2 [L]
*/

/* Probably don't need to edit anything under this line. */

// Bad hack
//if(!strpos($_SERVER['REQUEST_URI'],'.php')) {
//    header("Location: ".$_SERVER['REQUEST_URI']."index.php");
//    exit;
//}

$server_name = $_SERVER['SERVER_NAME'];
define('SERVER_NAME', $server_name);
$project_root = dirname(dirname(__FILE__));
$project_root = str_replace('\\', '/', $project_root);
define('NX_PATH_CORE', NX_PATH_BASE.'kernel/');
define('PROJECT_ROOT', $project_root);
define('PROJECT_NAME', 'phunkybb');
define('APP_NAME', 'phunkybb');

$server_init = PROJECT_ROOT.'/cache/'.SERVER_NAME.'/'.APP_NAME.'/'.APP_NAME.'.php';

if(!include(NX_PATH_BASE.'extensions/nexista_builder.php')) {
    echo 'Error: Unable to load server loader or builder.';
    exit;
}

// Loader not there or manually getting rebuilt? Build it!
if(!file_exists($server_init) || isset($_POST['x--dev--rebuild'])) {
    nexista_build_it_now($server_init);
} else { // Loader is there, check freshness, then either rebuild or include it.
    nexista_check_freshness($server_init);
    include($server_init);
    exit;
}
