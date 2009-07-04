<?php
/*
 * -File        spamc.plugin.php
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
 * This action cleanses text
 *
 * @package     Nexista Auth
 * @subpackage  Plugins
 */

class Nexista_SpamcAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'email' => '', //text node to parse
        'message' => '' //name of new flow node
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
        /* THIS IS JUST A STUB AT THE MOMENT */
    }
} //end class

?>