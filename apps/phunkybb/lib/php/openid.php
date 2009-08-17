<?php
/* <!--
Program: PhunkyBB
Component: openid.php
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


// check for form input
if (trim($_POST['openid'] == '')) {
die("ERROR: Please enter a valid OpenID.");
}

// include files
require_once "Auth/OpenID/Consumer.php";
require_once "Auth/OpenID/FileStore.php";

// start session (needed for YADIS)
session_start();

// create file storage area for OpenID data
$store = new Auth_OpenID_FileStore('/var/tmp/oid_store');

// create OpenID consumer
$consumer = new Auth_OpenID_Consumer($store);

// begin sign-in process
// create an authentication request to the OpenID provider
$auth = $consumer->begin($_POST['openid']);
if (!$auth) {
die("ERROR: Please enter a valid OpenID.");
}

$httphost = $_SERVER['HTTP_HOST'];

$path = $_SERVER['SCRIPT_NAME'];
if ($_GET['nxrw_path']) {
    $path = $_GET['nxrw_path'];
}
$path_prefix = dirname($path).'/';
$link_prefix = $path.'?nid=';

// redirect to OpenID provider for authentication
$url = $auth->redirectURL('http://'.$httphost, 'http://'.$httphost.$link_prefix.'x-openid-login-done');
header('Location: ' . $url);

?>