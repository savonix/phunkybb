<?php
/* <!-- 
Program: PhunkyBB
Component: config_build.php
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

$config = Nexista_Flow::getbypath('/_R_/config_get/config_get');

$code = '<?php $config = array(';

foreach($config as $conf_item) {
    // The crazy encoding / decoding is used for double and single quote variations
    // Basically we want to escape single quotes for the array only.
    $code .= "'".$conf_item['conf_name']."' => '".htmlspecialchars_decode(addslashes(htmlspecialchars($conf_item['conf_value'], ENT_COMPAT)), ENT_COMPAT)."',\n";
}
$code .= '); ?>';

if(!$_SESSION['site_id'] || $_SESSION['site_id']=='%') {
    $config_cache = NX_PATH_COMPILE.'config_cache.php';
} else {
    $config_cache = NX_PATH_COMPILE.$_SESSION['site_id'].'_config_cache.php';
}

file_put_contents($config_cache,$code);
?>