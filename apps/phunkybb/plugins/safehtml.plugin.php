<?php
/*
 * -File        safehtml.plugin.php
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

class Nexista_SafehtmlAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'text' => '' //text to parse
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {   
        include('HTML/Safe.php');
		$mytext = Nexista_Path::get($this->params['text']);
        $parser =& new HTML_Safe();
        $new_text = $parser->parse($mytext);
        Nexista_Flow::add("safe_html_text", $new_text);
        return true;

    }
} //end class

?>