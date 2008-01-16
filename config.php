<?php

define('CACHE_DIR',"/dev/shm/punbb/cache/".$_SERVER['SERVER_NAME']);
$conf = '/var/www/etc/punbb/config-'.strtolower($_SERVER['HTTP_HOST']).'.php';
if(is_file($conf)) {
    include($conf);
} else {
    header("Location: /blog/");
}
