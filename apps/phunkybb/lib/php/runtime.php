<?php
/*
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
*/

$defaults = Nexista_Config::getSection("./defaults");
Nexista_Flow::add("defaults",$defaults);

# This wacky path builder is required due to mod_rewrite situations
$path = $_SERVER['REQUEST_URI'];
$path = dirname($path)."/".basename($_SERVER['SCRIPT_NAME']);
$path_prefix = dirname($path)."/";
$link_prefix = $path."?nid=";

$utcdate = gmdate('Y-m-d H:i:s');

/* Expired session */
if($_SESSION['NX_AUTH']['username']==1016)
{
    $_SESSION['NX_AUTH']['username']=0;
}

/* Subversion revision */
if(is_file('../revision')) { 
    $svn_revision = file_get_contents('../revision');
} else {

}
$runtime = array(
                'path_prefix' => $path_prefix,
                'link_prefix' => $link_prefix,
                'svn_revision' => $svn_revision,
                'right_now' => $utcdate,
                'user_time_format' => "Y-m-d H:i:s",
                'username' => $_SESSION['NX_AUTH']['username'],
                'user_id' => $_SESSION['NX_AUTH']['user_id'],
                'group_id' => $_SESSION['NX_AUTH']['group_id'],
                'remote_ip' => $_SERVER['REMOTE_ADDR'],
                'timestamp' => time()
                );

Nexista_Flow::add("runtime",$runtime,false);


// From common.php, not sure if needed
define('PUN_UNVERIFIED', 32000);
define('PUN_ADMIN', 1);
define('PUN_MOD', 2);
define('PUN_GUEST', 3);
define('PUN_MEMBER', 4);
?>