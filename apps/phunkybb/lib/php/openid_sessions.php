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


// include files
require_once "Auth/OpenID/Consumer.php";
require_once "Auth/OpenID/FileStore.php";

// start session (needed for YADIS)
session_start();

// create file storage area for OpenID data
$store = new Auth_OpenID_FileStore('/var/tmp/oid_store');

// create OpenID consumer
// read response from OpenID provider
$consumer = new Auth_OpenID_Consumer($store);
$httphost = $_SERVER['HTTP_HOST'];
$response = $consumer->complete($httphost.$link_prefix.'x-openid-login-done');

// set session variable depending on authentication result
if ($response->status == Auth_OpenID_SUCCESS) {
  $_SESSION['OPENID_AUTH'] = true;
} else {
  $_SESSION['OPENID_AUTH'] = false;
}

$_SESSION['OPENID_AUTH'] = true;

$username = Nexista_Path::get('//user_login/user_login/username', 'flow');

$user_id = Nexista_Path::get('//user_login/user_login/id', 'flow');
$group_id = Nexista_Path::get('//user_login/user_login/group_id', 'flow');

$user_last_visit = Nexista_Path::get('//user_login/user_login/last_visit', 'flow');

$last_visit = gmdate('Y-m-d H:i:s',$user_last_visit);

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

$newarr = array('phunky_user');

$auth = &new Nexista_Auth();

if(!$auth->registerUser($newarr))
{
    trigger_error(Nexista_Error::getError(). ' in login.php', WARNING);
}


$auth->setSessionData('user_id', $user_id);
$auth->setSessionData('group_id', $group_id);
$auth->setSessionData('username', $username);
$auth->setSessionData('last_visit', $last_visit);
$auth->setSessionData('last_visit_timestamp', $user_last_visit);

if(1==0) {
header("Content-type: text/plain");
var_dump($_SESSION);
var_dump($_GET);
$blah = unserialize($_SESSION['_yadis_services__openid_consumer_']);
var_dump($blah['yadis_url']);
exit;
} else {
}
?>