<?php
/*
 * -File        tidy.plugin.php
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

class Nexista_TidyAction extends Nexista_Action
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

        $tidy = new tidy;
        $xpath = $this->params['text'];
        $node = Nexista_Flow::find($xpath);
        $config = array('output-xhtml'   => true);
        foreach($node as $item) {
            $tidy->parseString($item->nodeValue, $config, 'utf8');
            $tidy->cleanRepair();
            $item->nodeValue = str_replace('</body>','',str_replace('<body>','',$tidy->Body()));
        }

        return true;

    }
} //end class

?>