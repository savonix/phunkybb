<?php
/*
 * -File        random.plugin.php
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
 * This action generates a random string
 *
 * @package     Nexista Auth
 * @subpackage  Plugins
 */

class Nexista_RandomAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'name' => '', //required - new flow node name
        'randomness' => '' //optional
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
        $name = $this->params['name'];
        $count = $this->params['randomness'];
        if(!($count > 0)) { 
            $count = 8;
        }
        if (($ph = @popen('xxd -p -l '.$count.' /dev/urandom', 'r'))) {
            $rnd = fread($ph, $count);
            pclose($ph);
        }
        if (strlen($rnd) < $count) {
            $rnd = $rnd . mt_rand(100000,2000000);
            $rnd = substr($rnd, 0, $count);
        }
        Nexista_Flow::add($name, $rnd);
        return true;

    }
} //end class

?>