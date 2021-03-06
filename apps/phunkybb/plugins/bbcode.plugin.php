<?php
/*
 * -File        bbcode.plugin.php
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

class Nexista_BbcodeAction extends Nexista_Action
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
        include('HTML/BBCodeParser.php');
		$mytext = Nexista_Flow::getByPath($this->params['text']);
		$name = $this->params['name'];
        $parser = new HTML_BBCodeParser();
        $parser->addFilters('Basic,Extended,Links,Images,Lists');
        $new_text = $parser->qParse($mytext);
        Nexista_Flow::add($name, $new_text);
        return true;

    }
} //end class

?>