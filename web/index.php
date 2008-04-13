<?php

// Configuration 
// Where is nexista? This path should be to a folder which contains a folder called "nexista"
$nexista_path = "/var/www/dev/nexista/";

if($_SERVER['REQUEST_URI']=="/forums/") { 
    header("Location: /forums/index.php");
    }

$server_name = $_SERVER['SERVER_NAME'];
define('SERVER_NAME',$server_name);
$project_root = dirname(dirname(__FILE__));
define('PROJECT_ROOT',$project_root);
define('PROJECT_NAME','phunkybb');
define('APP_NAME','phunkybb');

$server_init = "/dev/shm/".SERVER_NAME."/".APP_NAME."/".APP_NAME.".php";


    

if(!include($nexista_path.'/plugins/builder.php')) {
    echo "Error: Unable to load server loader or builder.";
    exit;
}



// Loader not there or manually getting rebuilt? Build it!
if(!file_exists($server_init) || isset($_GET['nxbin'])) {
    build_it_now();
} else { // Loader is there, check freshness, then either rebuild or include it.
    check_freshness();
        include($server_init);
        exit;
}

