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






?>