<!--
Program: PhunkyBB
Component: admin_options.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="main.xsl"/>
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">
<div id="adminconsole" class="block2col">
<xsl:call-template name="admin-menu"/>

<div class="blockform">
    <h2><span>Options</span></h2>
    <div class="box">
        <form method="post" action="{//link_prefix}options-submit&amp;view_flow=true">
            <p class="submittop"><input type="submit" name="save" value="Save Changes" /></p>
            <div class="inform">
            <input type="hidden" name="form_sent" value="" />
                <fieldset>

                    <legend>Essentials</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Board title</th>
                                <td>
                                    <input type="text" name="form[o_board_title]" size="50" maxlength="255" value="{//board_config/o_board_title}" />
                                    <span>The title of this bulletin board (shown at the top of every page). This field may <strong>not</strong> contain HTML.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Board description</th>
                                <td>
                                    <input type="text" name="form[o_board_desc]" size="50" maxlength="255" value="{//board_config/o_board_desc}" />
                                    <span>A short description of this bulletin board (shown at the top of every page). This field may contain HTML.</span>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row">Base URL</th>
                                <td>
                                    <input type="text" name="form[o_base_url]" size="50" maxlength="100" value="{//board_config/o_base_url}" />
                                    <span>The complete URL of the forum without trailing slash (i.e. http://www.mydomain.com/forums). This <strong>must</strong> be correct in order for all admin and moderator features to work. If you get "Bad referer" errors, it's probably incorrect.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Server timezone</th>
                                <td>
                                    <select name="form[o_server_timezone]">
                                    <xsl:for-each select="//tzdata/option">
                                        <option value="{@value}"><xsl:value-of select="."/></option>
                                    </xsl:for-each>
                                    </select>
                                    <span>The timezone of the server where PunBB is installed.</span>

                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="inform">
                <fieldset>

                    <legend>Time and timeouts</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Time format</th>
                                <td>
                                    <input type="text" name="form[o_time_format]" size="25" maxlength="25" value="{//board_config/o_time_format}" />
                                    <span>[Current format: 12:11:16]See <a href="http://www.php.net/manual/en/function.date.php">here</a> for formatting options.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Date format</th>
                                <td>
                                    <input type="text" name="form[o_date_format]" size="25" maxlength="25" value="{//board_config/o_date_format}" />
                                    <span>[Current format: 2008-03-01]See <a href="http://www.php.net/manual/en/function.date.php">here</a> for formatting options.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Visit timeout</th>
                                <td>
                                    <input type="text" name="form[o_timeout_visit]" size="5" maxlength="5" value="{//board_config/o_timeout_visit}" />
                                    <span>Number of seconds a user must be idle before his/hers last visit data is updated (primarily affects new message indicators).</span>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row">Online timeout</th>
                                <td>
                                    <input type="text" name="form[o_timeout_online]" size="5" maxlength="5" value="" />
                                    <span>Number of seconds a user must be idle before being removed from the online users list.</span>
                                </td>
                            </tr>
                        </table>

                    </div>
                </fieldset>
            </div>

            <div class="inform">
                <fieldset>
                    <legend>Features</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Quick post</th>
                                <td>

                                    <input type="radio" name="form[o_quickpost]" value="" /><strong>No</strong>
                                    <span>When enabled, PunBB will add a quick post form at the bottom of topics. This way users can post directly from the topic view.</span>
                                </td>
                            </tr>
                            <tr>

                                <th scope="row">Additional menu items</th>
                                <td>
                                    <textarea name="form[o_additional_navlinks]" rows="3" cols="55"></textarea>
                                    <span>By entering HTML hyperlinks into this textbox, any number of items can be added to the navigation menu at the top of all pages. The format for adding new links is X = &lt;a href="URL"&gt;LINK&lt;/a&gt; where X is the position at which the link should be inserted (e.g. 0 to insert at the beginning and 2 to insert after "User list"). Separate entries with a linebreak.</span>
                                </td>

                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="inform">
                <fieldset>
                    <legend>E-mail</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>

                                <th scope="row">Admin e-mail</th>
                                <td>
                                    <input type="text" name="form[o_admin_email]" size="50" maxlength="50" value="{//board_config/o_admin_email}" />
                                    <span>The e-mail address of the forum administrator.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Webmaster e-mail</th>

                                <td>
                                    <input type="text" name="form[o_webmaster_email]" size="50" maxlength="50" value="{//board_config/o_webmaster_email}" />
                                    <span>This is the address that all e-mails sent by the forum will be addressed from.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Subscriptions</th>
                                <td>

                                    <input type="radio" name="form[o_subscriptions]" value="{//board_config/o_subscriptions}" /><strong>No</strong>
                                    <span>Enable users to subscribe to topics (recieve e-mail when someone replies).</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">SMTP server address</th>
                                <td>

                                    <input type="text" name="form[o_smtp_host]" size="30" maxlength="100" value="{//board_config/o_smtp_host}" />
                                    <span>The address of an external SMTP server to send e-mails with. You can specify a custom port number if the SMTP server doesn't run on the default port 25 (example: mail.myhost.com:3580). Leave blank to use the local mail program.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">SMTP username</th>
                                <td>
                                    <input type="text" name="form[o_smtp_user]" size="25" maxlength="50" value="{//board_config/o_smtp_user}" />

                                    <span>Username for SMTP server. Only enter a username if it is required by the SMTP server (most servers <strong>do not</strong> require authentication).</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">SMTP password</th>
                                <td>

                                    <input type="text" name="form[o_smtp_pass]" size="25" maxlength="50" value="{//board_config/o_smtp_host}" />
                                    <span>Password for SMTP server. Only enter a password if it is required by the SMTP server (most servers <strong>do not</strong> require authentication).</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>

            </div>
            <div class="inform">
                <fieldset>
                    <legend>Registration</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Allow new registrations</th>

                                <td>
                                    <input type="radio" name="form[o_regs_allow]" value="" /><strong>No</strong>
                                    <span>Controls whether this forum accepts new registrations. Disable only under special circumstances.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Verify registrations</th>

                                <td>
                                    <input type="radio" name="form[o_regs_verify]" value="" /><strong>No</strong>
                                    <span>When enabled, users are e-mailed a random password when they register. They can then log in and change the password in their profile if they see fit. This feature also requires users to verify new e-mail addresses if they choose to change from the one they registered with. This is an effective way of avoiding registration abuse and making sure that all users have "correct" e-mail addresses in their profiles.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Use forum rules</th>

                                <td>
                                    <input type="radio" name="form[o_rules]" value="" /><strong>No</strong>
                                    <span>When enabled, users must agree to a set of rules when registering (enter text below). The rules will always be available through a link in the navigation table at the top of every page.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Rules</th>

                                <td>
                                    <textarea name="form[o_rules_message]" rows="10" cols="55">Enter your rules here.</textarea>
                                    <span>Here you can enter any rules or other information that the user must review and accept when registering. If you enabled rules above you have to enter something here, otherwise it will be disabled. This text will not be parsed like regular posts and thus may contain HTML.</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>

            </div>
            <div class="inform">
                <fieldset>
                    <legend>Announcement</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row">Display announcement</th>

                                <td>
                                    <input type="radio" name="form[o_announcement]" value="" /><strong>No</strong>
                                    <span>Enable this to display the below message in the forums.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Announcement message</th>

                                <td>
                                    <textarea name="form[o_announcement_message]" rows="5" cols="55">Enter your announcement here.</textarea>
                                    <span>This text will not be parsed like regular posts and thus may contain HTML.</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>

            </div>
            <div class="inform">
                <fieldset>
                    <legend>Maintenance</legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><a name="maintenance">Maintenance mode</a></th>

                                <td>
                                    <input type="radio" name="form[o_maintenance]" value="" /><strong>No</strong>
                                    <span>When enabled, the board will only be available to administrators. This should be used if the board needs to taken down temporarily for maintenance. WARNING! Do not log out when the board is in maintenance mode. You will not be able to login again.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Maintenance message</th>

                                <td>
                                    <textarea name="form[o_maintenance_message]" rows="5" cols="55">The forums are temporarily down for maintenance. Please try again in a few minutes.&lt;br /&gt;\n&lt;br /&gt;\n/Administrator</textarea>
                                    <span>The message that will be displayed to users when the board is in maintenance mode. If left blank a default message will be used. This text will not be parsed like regular posts and thus may contain HTML.</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>

            </div>
            <p class="submitend"><input type="submit" name="save" value="Save Changes" /></p>
        </form>
    </div>
</div>
<div class="clearer"></div>
</div>

</xsl:template>
</xsl:stylesheet>
