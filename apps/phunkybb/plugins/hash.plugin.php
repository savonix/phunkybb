<?php
/*
 * -File        hash.plugin.php
 * -License     LGPL (http://www.gnu.org/copyleft/lesser.html)
 * -Copyright   Savonix Corporation
 * -Author		Albert Lash
 */

/**
 * @package     Nexista Auth
 * @subpackage  Plugins
 * @author      Albert Lash
 */
 
/**
 * This action applies hashes data
 *
 * @package     Nexista Auth
 * @subpackage  Plugins
 */

class Nexista_HashAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'hash_type' => '', //required - hash type, e.g. md5, sha1, etc.
        'pwd' => '', //required - name of flow var to hash
        'salt' => '', //optional - salt used in hash process
        'randomness' => '' //optional - entropy bit count
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
        // http://www.php.net/manual/en/function.crypt.php
		$pwd = Nexista_Flow::find($this->params['pwd']);
        $hash_type = $this->params['hash_type'];
        $count = 8;
        if($pwd->length === 1)
        {
            $mypwd = $pwd->item(0)->nodeValue;
        }
        // If a cryptmd5 is selected, a hash is either provided or is generated.
        // The code used here to generate 
        if($hash_type == "cryptmd5" || (!empty($this->params['salt']))) {
            // Got salt?
            if($this->params['salt']=='') {
                $mysalt = '';
                if (($ph = @popen('xxd -p -l '.$count.' /dev/urandom', 'r'))) {
                    $mysalt = fread($ph, $count);
                    pclose($ph);
                }
                if (strlen($mysalt) < $count) {
                    $mysalt = $mysalt . mt_rand(100000,2000000);
                    $mysalt = substr($mysalt, 0, $count);
                }
                $mysalt = "$1$".$mysalt."$";
            } else {
                $salt = Nexista_Flow::find($this->params['salt']);
                $mysalt = $salt->item(0)->nodeValue;
            }
            $hash = crypt($mypwd, $mysalt);

        // Non-salted hash
        // http://www.php.net/manual/en/function.hash.php
        } elseif (in_array($hash_type,hash_algos())) { 

            $hash = hash($hash_type,$mypwd);

        } else {

            return false;

        }
        Nexista_Flow::add("hash", $hash);
        return true;

    }
} //end class

?>