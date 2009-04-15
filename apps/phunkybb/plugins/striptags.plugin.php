<?php
/*
 * -File        striptags.plugin.php
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

class Nexista_StriptagsAction extends Nexista_Action
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
		$mytext = Nexista_Path::get($this->params['text']);
        $new_text = strip_tags($mytext);
        Nexista_Flow::add('no_html_text', $new_text);
        return true;

    }
} //end class

?>