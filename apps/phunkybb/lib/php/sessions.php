<?php












$username = Nexista_Path::get('//user_login/username', 'flow');
$user_id = Nexista_Path::get('//user_login/id', 'flow');
$group_id = Nexista_Path::get('//user_login/group_id', 'flow');

// Remove duplicate roles
if(is_array($roles)) { 
	$tmparr = array_unique($roles);

	$i=0;

	foreach ($tmparr as $v) {
		$newarr[$i] = $v;
		$i++;
	}

} else { 
	$newarr=$roles;
}

$newarr =array('phunky_user','phunky_admin');

$auth = &new Nexista_Auth();
        
if(!$auth->registerUser($newarr))
{
    trigger_error(Nexista_Error::getError(). ' in login.php', WARNING);         
}


$auth->setSessionData("user_id", $user_id);
$auth->setSessionData("group_id", $group_id);
$auth->setSessionData("username", $username);


//go back where we were called from
$redirect = Nexista_Path::get('//_post/redirect', 'flow');
if(isset($_SESSION['NX_AUTH']['requestedUrl']) && (!$_SESSION['NX_AUTH']['requestedUrl']=="")) { 
    $redirect = $_SESSION['NX_AUTH']['requestedUrl'];	
} else { 
    $redirect = Nexista_Config::get("//build/default");
}

if($_GET['nid']=="ajax-check")
{
    echo '<result>Success</result>';
    exit;
}
else 
{
    header("Location: $redirect");
}
?>