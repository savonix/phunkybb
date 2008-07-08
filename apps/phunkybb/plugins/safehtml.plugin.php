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
        'text' => '', //text node to parse
        'name' => '' //name of new flow node
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
        include('HTML/Safe.php');
		$mytext = Nexista_Flow::getByPath($this->params['text']);
        $name = $this->params['name'];
        $parser =& new HTML_Safe();
        $new_text = $parser->parse($mytext);
        if(empty($name)) {
            $node = Nexista_Flow::find($this->params['text']);
            $node->item(0)->nodeValue = $new_text;
        } else {
            Nexista_Flow::add($name, $new_text);
        }
        return true;

    }
} //end class

?>