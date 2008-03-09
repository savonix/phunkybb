<?php

include('xdump/xdump.php');
$config_cache = NX_PATH_COMPILE."config_cache.php";
if(is_file($config_cache)){
    include($config_cache);
}
//echo xDump::dump($_SESSION);

//Nexista_Flow::add("board_config",$config,false);

$defaults = Nexista_Config::getSection("./defaults");
Nexista_Flow::add("defaults",$defaults);

# This wacky path builder is required due to mod_rewrite situations
$path = $_SERVER['REQUEST_URI'];
Nexista_Flow::add("request_uri",$path);
$path = dirname($path)."/".basename($_SERVER['SCRIPT_NAME']);
$path_prefix = dirname($path)."/";
//$app_prefix = "acc/".APP_NAME."/";
//$link_prefix = $path."?nid=".$app_prefix;
$link_prefix = $path."?nid=";

// Also need server location
$tz_offset = $_SESSION['timezone'];
$right_now = date('Y-m-d H:i:s',time()+(3600*$tz_offset));


$runtime = array('host_name'=>$_SERVER['SERVER_NAME'],
                'request_uri'=>$_SERVER['REQUEST_URI'],
                'path_prefix'=>$path_prefix,
                'link_prefix'=>$link_prefix,
                'right_now'=>$right_now,
                'user_timezone_offset'=> $tz_offset,
                'user_time_format'=> "Y-m-d H:i:s",
                'username'=>$_SESSION['NX_AUTH']['username'],
                'user_id'=>$_SESSION['NX_AUTH']['user_id'],
                'group_id'=>$_SESSION['NX_AUTH']['group_id'],
                'remote_ip'=>$_SERVER['REMOTE_ADDR'],
                'debug'=>$debug,
                'admin'=>1,
                'top_left_logo'=>$top_left_logo,
                'db_version'=>$db_version,
                'timestamp'=>time());

Nexista_Flow::add("runtime",$runtime,false);


// From common.php, not sure if needed
define('PUN_UNVERIFIED', 32000);
define('PUN_ADMIN', 1);
define('PUN_MOD', 2);
define('PUN_GUEST', 3);
define('PUN_MEMBER', 4);
?>