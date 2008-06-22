=pod
Program: PhunkyBB
Component: config_build.pm
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
=cut


$config = Apache2::Aortica::Kernel::Flow::get_value_by_path('/_R_/config_get/config_get');

$code = '$config = array(';

foreach($config as $conf_item) { 
    $code .= "'".$conf_item['conf_name']."' => '".addslashes($conf_item['conf_value'])."',\n";
}
$code .= "); ?>";

$config_cache = NX_PATH_COMPILE."config_cache.php";

file_put_contents($config_cache,$code);
