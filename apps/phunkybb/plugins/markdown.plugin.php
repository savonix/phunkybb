<?php
/*
 * -File        markdown.plugin.php
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
 * This action parses bbCode into HTML.
 *
 * @package     Nexista Auth
 * @subpackage  Plugins
 */

class Nexista_MarkdownAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'text' => '', //text to parse
        'name' => '' //text to parse
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
        include_once "markdown.php";
		$mytext   = Nexista_Flow::getByPath($this->params['text']);
        $new_text = Markdown($my_text);
		$name     = $this->params['name'];
        Nexista_Flow::add($name, $new_text);
        return true;

    }
} //end class

?>