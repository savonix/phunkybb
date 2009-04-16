<?php
/* <!--
Program: PhunkyBB
Component: runtime.php
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
Fifth Floor, Boston, MA 02110-1301 USA -->
*/

/*
For use with Apache's mod_rewrite

RewriteCond %{REQUEST_URI} ^/a/dev/phunkybb/
RewriteCond %{REQUEST_URI} !/a/dev/phunkybb/index.php|.css
RewriteRule ^/a/dev/phunkybb/(\w+)/$ /a/dev/phunkybb/index.php?nxrw_path=/a/dev/phunkybb/index.php&nid=forum&forum_basename=$1 [L]

RewriteCond %{REQUEST_URI} ^/a/dev/phunkybb/
RewriteCond %{REQUEST_URI} !/a/dev/phunkybb/index.php|.css
RewriteRule ^/a/dev/phunkybb/(\w+)/(\w+)/ /a/dev/phunkybb/index.php?nxrw_path=/a/dev/phunkybb/index.php&nid=topic&forum_basename=$1&basename=$2 [L]
*/


$defaults = Nexista_Config::getSection('./defaults');
Nexista_Flow::add('defaults', $defaults);
//print_r($defaults);
$path = $_SERVER['SCRIPT_NAME'];
if ($_GET['nxrw_path']) {
    $path = $_GET['nxrw_path'];
}
$path_prefix = dirname($path).'/';
$link_prefix = $path.'?nid=';

/* Expired session */
if($_SESSION['NX_AUTH']['username']==1016)
{
    $_SESSION['NX_AUTH']['username']=0;
}

// Prefix is needed for Mozilla as its the 0 position.
$ua = '_' . $_SERVER['HTTP_USER_AGENT'];

if(strpos($ua,'Google') || strpos($ua,'Yahoo') || strpos($ua,'bot')) {
    $user_agent = 'bot';
} elseif(strpos($ua,'Mozilla') || strpos($ua,'Opera')) {
    $user_agent = 'gui_browser';
} elseif (strpos($ua,'Elinks') || strpos($ua,'w3m') || strpos($ua,'Lynx')) {
    $user_agent = 'text_browser';
} else {
    $user_agent = 'bot';
}

/* Allow the admin to select site_id, everyone
 else must use the domain assigned id */
if ( $_SESSION['NX_AUTH']['group_id'] == 1 && strpos($_GET['nid'],'admin')) {
    if(isset($_GET['site_id'])) {
        $_SESSION['site_id'] = $_GET['site_id'];
    } elseif (!$_SESSION['site_id'] && strpos($_GET['nid'],'admin')) {
        $_SESSION['site_id'] = '%';
    }
    $site_id = $_SESSION['site_id'];
} else {
    // This needs to be set by $_SERVER
    $site_id = 4;
}



$runtime = array(
    'path_prefix' => $path_prefix,
    'link_prefix' => $link_prefix,
    'mod_rewrite' => 'true',
    'utcdate' => gmdate('Y-m-d H:i:s'),
    'user_agent' => $user_agent,
    'debug' => 1,
    'incr' => 10,
    'user_time_format' => 'r',
    'username' => $_SESSION['NX_AUTH']['username'],
    'last_visit' => $_SESSION['NX_AUTH']['last_visit'],
    'last_visit_timestamp' => $_SESSION['NX_AUTH']['last_visit_timestamp'],
    'user_id' => $_SESSION['NX_AUTH']['user_id'],
    'group_id' => $_SESSION['NX_AUTH']['group_id'],
    'remote_ip' => $_SERVER['REMOTE_ADDR'],
    'timestamp' => time(),
    'site_id' => $site_id
    );

if($_GET['nid']=='user-read-all') {
    $auth = &new Nexista_Auth();
    $last_visit = time();
    $auth->setSessionData('last_visit', $last_visit);
    $auth->setSessionData('last_visit_timestamp', $last_visit);
}

Nexista_Flow::add('runtime',$runtime,false);

?>
