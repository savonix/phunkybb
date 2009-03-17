<?php
/* <!--
Program: PhunkyBB
Component: sessions.php
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
--> */

$username = Nexista_Path::get('//user_login/user_login/username', 'flow');

$user_id = Nexista_Path::get('//user_login/user_login/id', 'flow');
$group_id = Nexista_Path::get('//user_login/user_login/group_id', 'flow');

$user_timezone = Nexista_Path::get('//_post/my_tz_offset', 'flow');
$user_last_visit = Nexista_Path::get('//user_login/user_login/last_visit', 'flow');
$tz = $user_timezone * 3600;
$last_visit = gmdate('Y-m-d H:i:s',$user_last_visit + $tz);
$_SESSION['timezone'] = $user_timezone;

// Remove duplicate roles
if(is_array($roles)) { 
	$tmparr = array_unique($roles);

	$i=0;

	foreach ($tmparr as $v) {
		$newarr[$i] = $v;
		$i++;
	}

} else {
	$newarr = $roles;
}

$newarr = array('phunky_user','phunky_admin');

$auth = &new Nexista_Auth();

if(!$auth->registerUser($newarr))
{
    trigger_error(Nexista_Error::getError(). ' in login.php', WARNING);
}


$auth->setSessionData("user_id", $user_id);
$auth->setSessionData("group_id", $group_id);
$auth->setSessionData("username", $username);
$auth->setSessionData("last_visit", $last_visit);
$auth->setSessionData("last_visit_timestamp", $user_last_visit);


//go back where we were called from
$redirect = Nexista_Path::get('//_post/redirect', 'flow');
if(isset($_SESSION['NX_AUTH']['requestedUrl']) && (!$_SESSION['NX_AUTH']['requestedUrl']=="")) {
    $redirect = $_SESSION['NX_AUTH']['requestedUrl'];
} else {
    $redirect = Nexista_Config::get("//build/default");
}

if($_GET['nid']=="x-login")
{
    echo '<result>Success</result>';
    exit;
}
else
{
    header("Location: $redirect");
}
?>