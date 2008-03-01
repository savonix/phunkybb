<?php
/***********************************************************************

  Copyright (C) 2002-2005  Rickard Andersson (rickard@punbb.org)

  This file is part of PunBB.

  PunBB is free software; you can redistribute it and/or modify it
  under the terms of the GNU General Public License as published
  by the Free Software Foundation; either version 2 of the License,
  or (at your option) any later version.

  PunBB is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston,
  MA  02111-1307  USA

************************************************************************/

// Make sure no one attempts to run this script "directly"
if (!defined('PUN'))
    exit;

// Tell admin_loader.php that this is indeed a plugin and that it is loaded
define('PUN_PLUGIN_LOADED', 1);

//
// The rest is up to you!
//

// If the "Show text" button was clicked
if (isset($_POST['show_text']))
{
    // Make sure something something was entered
    if (trim($_POST['google_analytics_code']) == '')
        message('You didn\'t enter anything!');

    // Display the admin navigation menu
    //generate_admin_menu($plugin);

    $value = $_POST['google_analytics_code'];
    $db->query('DELETE FROM '.$db->prefix.'config WHERE conf_name=\'o_google_analytics_code\'') or error('Unable to update 
board config', __FILE__, __LINE__, $db->error());


$db->query('INSERT INTO '.$db->prefix.'config (conf_value, conf_name) VALUES (\''.$value.'\',"o_google_analytics_code")') or 
error('Unable to update board config', __FILE__, __LINE__, $db->error());
?>
    <div class="block">
        <h2><span>Google Analytics Plugin</span></h2>
        <div class="box">
            <div class="inbox">
            <p>Your analytics code: </p>
            </div>
        </div>
    </div>

<?php

}
    // Display the admin navigation menu
    generate_admin_menu($plugin);

?>
    <div id="exampleplugin" class="blockform">
        <h2><span>Google Analytics Plugin</span></h2>
        <div class="box">
            <div class="inbox">
                <p>This plugin adds your Google Analytics (previously known as Urchin) to your forum.</p>
            </div>
        </div>

        <h2 class="block2"><span>Code</span></h2>
        <div class="box">
            <form id="example" method="post" action="<?php echo $_SERVER['REQUEST_URI'] ?>&amp;foo=bar">
                <div class="inform">
                    <fieldset>
                        <legend>Enter your Google Analytics Code!</legend>
                        <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Google Analytics Code<div><input type="submit" name="show_text" value="Show 
text" tabindex="2" /></div></th>
                                <td>
                                    <input type="text" name="google_analytics_code" size="25" tabindex="1" value="<?php echo 
$pun_config['o_google_analytics_code']; ?>"/>
                                    <span>Google Analytics Code.</span>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
<?php



// Note that the script just ends here. The footer will be included by admin_loader.php.
