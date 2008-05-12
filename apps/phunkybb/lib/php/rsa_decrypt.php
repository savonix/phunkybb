<?php
/*
Program: PhunkyBB
Component: rsa_decrypt.php
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
// openssl genrsa -out key.pem
// openssl rsa -in key.pem -noout -modulus
// str_replace('Modulus=','',$modulus);
// put modulus in config.xml defaults

$mpk = PROJECT_ROOT.'/config/key.pem';
$pk = file_get_contents($mpk);
$private_key = openssl_pkey_get_private($pk);


$encrypted_password = Nexista_Path::get('{//_post/password}');

$binary_pw = base64_decode($encrypted_password);

if(openssl_private_decrypt($binary_pw,&$clear,$private_key))
{
    // success
    Nexista_Flow::add("cleartext",$clear);
}
else
{
    // failure
    echo '<result>Failure</result>';
    exit;
}
?>
