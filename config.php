<?php

define('CACHE_DIR',"/dev/shm/phunkybb/cache/".$_SERVER['SERVER_NAME']);
define('CONF_DIR',"/var/www/etc/phunkybb");

if(!is_dir('CACHE_DIR')) { 
    exec("mkdir -p ".CACHE_DIR);
}

$conf = CONF_DIR.'/config-'.strtolower($_SERVER['HTTP_HOST']).'.php';
if(is_file($conf)) {
    include($conf);
} else {
    header("Location: /blog/");
}
