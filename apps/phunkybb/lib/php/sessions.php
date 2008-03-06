<?php



if($_GET['nid']=="logout") { 
    $auth = &new Nexista_Auth();
    $auth->removeUser();
    $auth->removeUser();
    
    unset($_SESSION['NX_AUTH']);
    Nexista_Flow::delete("logged_in");
    Nexista_Flow::add("logged_in", "false");
    session_start();
    
    // Unset all of the session variables.
    $_SESSION = array();
    
    // If it's desired to kill the session, also delete the session cookie.
    // Note: This will destroy the session, and not just the session data!
    if (isset($_COOKIE[session_name()])) {
       setcookie(session_name(), '', time()-42000, '/');
    }
    
    // Finally, destroy the session.
    session_destroy();
}




if(openssl_private_decrypt(
        $encrypted_password,
        &$cleartext_password,
        $private_key))
{
    // success
} 
else
{
    //failure
}








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

echo "hi";
//header("Location: $redirect");

?>