<?php


$config = Nexista_Flow::getbypath('//config_get');


// Believe it or not, for Nexista, XML is faster.
$code = '<?php $config = array(';

foreach($config as $conf_item) { 
    $code .= "'".$conf_item['conf_name']."' => '".addslashes($conf_item['conf_value'])."',\n";
//    print_r($conf_item);
}
$code .= "); ?>";

/*

$code = '<board_config>';

foreach($config as $conf_item) { 
    $code .= "\t<".$conf_item['conf_name'].">".$conf_item['conf_value']."</".$conf_item['conf_name'].">\n";
}
$code .= "</board_config>";
*/
$config_cache = NX_PATH_COMPILE."config_cache.php";

file_put_contents($config_cache,$code);
?>