<?php
/*
Program: PhunkyBB
Component: decrypt_rsa.plugin.php
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
*/

class Nexista_Decrypt_RsaAction extends Nexista_Action
{


    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'private_key' => '', //path to private key
        'ciphered_text' => '' //test to decrypt
		);


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {

        // openssl genrsa -out key.pem
        // openssl rsa -in key.pem -noout -modulus
        // str_replace('Modulus=','',$modulus);
        // put modulus in config.xml defaults
        
        $mpk = Nexista_Path::get($this->params['private_key']);
        
        $pk = file_get_contents($mpk);
        $my_private_key = openssl_pkey_get_private($pk);
        
        $cipher_text = Nexista_Flow::find($this->params['ciphered_text']);
        if($cipher_text->length === 1)
        {
            $my_cipher_text = $cipher_text->item(0)->nodeValue;
        }

        $my_cipher_text_bin = base64_decode($my_cipher_text);

        if(openssl_private_decrypt($my_cipher_text_bin,&$my_clear_text,$my_private_key))
        {
            // success
            $cipher_text->item(0)->nodeValue = $my_clear_text;
        }
        else
        {
            return false;
        }

    }
} //end class

?>