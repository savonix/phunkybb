<?php
/*
Program: PhunkyBB
Component: config_check.php
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

$pre_install_check = PROJECT_ROOT."/config/del_file_after_install";
if(is_file($pre_install_check) && $_GET['nid']!='install') {
    header("Location: index.php?nid=install");
    exit;
}

$config_cache = NX_PATH_COMPILE."config_cache.php";

if(is_file($config_cache)) { 
    Nexista_Flow::add("config_cache","true");
    include($config_cache);
    Nexista_Flow::add("board_config",$config);
}
?>