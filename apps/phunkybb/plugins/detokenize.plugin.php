<?php
/*
 * -File        detokenize.plugin.php
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

class Nexista_DetokenizeAction extends Nexista_Action
{

    /**
     * Function parameter array
     *
     * @var array
     */

    protected  $params = array(
        'haystack' => '', //text to detokenize
        'token_array_xpath' => '' //node containing key value pairs of tokens to replace.
        );


    /**
     * Applies action
     *
     * @return  boolean success
     */

    protected  function main()
    {
		$text = Nexista_Path::get($this->params['haystack']);
        $tokens = Nexista_Flow::getbypath($this->params['token_array_xpath']);
        /*
        echo "<pre>";
        print_r($tokens);
        echo "</pre>";
        echo "<br/>";
        */
        foreach ($tokens as $token)
        {
            $text = str_replace($token['key'],Nexista_Flow::getbypath($token['value']),$text);
        }
        Nexista_Flow::add("new_text", $text);
        return true;

    }
} //end class

?>