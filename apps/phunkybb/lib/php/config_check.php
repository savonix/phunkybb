<?php

$config_cache = NX_PATH_COMPILE."config_cache.xml";

if(is_file($config_cache)) { 
    Nexista_Flow::add("config_cache","true");
}
?>