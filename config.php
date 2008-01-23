<?php

define('CACHE_DIR',"/dev/shm/punbb/cache/".$_SERVER['SERVER_NAME']);

if(!is_dir('CACHE_DIR')) { 
    `mkdir -p CACHE_DIR`
    }
$conf = '/var/www/etc/punbb/config-'.strtolower($_SERVER['HTTP_HOST']).'.php';
if(is_file($conf)) {
    include($conf);
} else {
    header("Location: /blog/");
}
