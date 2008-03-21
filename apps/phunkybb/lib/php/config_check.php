<?php

$config_cache = NX_PATH_COMPILE."config_cache.php";

if(is_file($config_cache)) { 
    Nexista_Flow::add("config_cache","true");
    include($config_cache);
    Nexista_Flow::add("board_config",$config);
}
?>