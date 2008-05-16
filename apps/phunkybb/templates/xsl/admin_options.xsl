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
    <h2><span><xsl:value-of select="//i18n/labels/label[key='options']/value"/></span></h2>
    <div class="box">
        <form method="post" action="{//link_prefix}options-submit&amp;view_flow=true">
            <p class="submittop"><input type="submit" name="save" value="Save Changes" /></p>
            <div class="inform">
            <input type="hidden" name="form_sent" value="" />
                <fieldset>

                    <legend><xsl:value-of select="//i18n/labels/label[key='essentials']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='board_title']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_board_title]" size="50" maxlength="255" value="{//board_config/o_board_title}" />
                                    <span><xsl:value-of select="//label[key='title_of_buletine_board']/value"/> <strong><xsl:value-of select="//label[key='not']/value"/></strong> <xsl:value-of select="//label[key='contain_html']/value"/>.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='board_description']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_board_desc]" size="50" maxlength="255" value="{//board_config/o_board_desc}" />
                                    <span><xsl:value-of select="//label[key='short_description_of_this']/value"/>.</span>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='base_url']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_base_url]" size="50" maxlength="100" value="{//board_config/o_base_url}" />
                                    <span><xsl:value-of select="//label[key='complete_url_of_the_forum']/value"/> <strong><xsl:value-of select="//label[key='must']/value"/></strong> <xsl:value-of select="//label[key='be_correct_in_order']/value"/>.</span>

                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="inform">
                <fieldset>

                    <legend><xsl:value-of select="//label[key='time_and_timeouts']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='time_format']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_time_format]" size="25" maxlength="25" value="{//board_config/o_time_format}" />
                                    <span>[Current format: 12:11:16]See <a href="http://www.php.net/manual/en/function.date.php"><xsl:value-of select="//label[key='here']/value"/></a> <xsl:value-of select="//label[key='for_formatting_options']/value"/>.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='date_format']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_date_format]" size="25" maxlength="25" value="{//board_config/o_date_format}" />
                                    <span>[Current format: 2008-03-01]See <a href="http://www.php.net/manual/en/function.date.php"><xsl:value-of select="//label[key='here']/value"/></a> <xsl:value-of select="//label[key='for_formatting_options']/value"/>.</span>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='visit_timeout']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_timeout_visit]" size="5" maxlength="5" value="{//board_config/o_timeout_visit}" />
                                    <span><xsl:value-of select="//label[key='number_of_seconds_a_user_last_visit']/value"/>.</span>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='online_timeout']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_timeout_online]" size="5" maxlength="5" value="" />
                                    <span><xsl:value-of select="//label[key='number_of_seconds_a_user_idle_before_removed']/value"/>.</span>
                                </td>
                            </tr>
                        </table>

                    </div>
                </fieldset>
            </div>

            <div class="inform">
                <fieldset>
                    <legend><xsl:value-of select="//label[key='features']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='quick_post']/value"/></th>
                                <td>

                                    <input type="radio" name="form[o_quickpost]" value="" /><strong><xsl:value-of select="//label[key='no']/value"/></strong>
                                    <span><xsl:value-of select="//label[key='when_enabled_punbb']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>

                                <th scope="row"><xsl:value-of select="//label[key='additional_menu_items']/value"/></th>
                                <td>
                                    <textarea name="form[o_additional_navlinks]" rows="3" cols="55"></textarea>
                                    <span><xsl:value-of select="//label[key='by entering html hyperlinks']/value"/> X = &lt;a href="URL"&gt;LINK&lt;/a&gt; <xsl:value-of select="//label[key='x_is_the_position']/value"/>.</span>
                                </td>

                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="inform">
                <fieldset>
                    <legend><xsl:value-of select="//label[key='email']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>

                                <th scope="row"><xsl:value-of select="//label[key='admin_email']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_admin_email]" size="50" maxlength="50" value="{//board_config/o_admin_email}" />
                                    <span><xsl:value-of select="//label[key='email_of_forum_admin']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='webmaster_email']/value"/></th>

                                <td>
                                    <input type="text" name="form[o_webmaster_email]" size="50" maxlength="50" value="{//board_config/o_webmaster_email}" />
                                    <span><xsl:value-of select="//label[key='address_all_email_sent_from']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='subscriptions']/value"/></th>
                                <td>

                                    <input type="radio" name="form[o_subscriptions]" value="{//board_config/o_subscriptions}" /><strong>No</strong>
                                    <span><xsl:value-of select="//label[key='enable_users_to_subscribe']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='smtp_server_address']/value"/></th>
                                <td>

                                    <input type="text" name="form[o_smtp_host]" size="30" maxlength="100" value="{//board_config/o_smtp_host}" />
                                    <span><xsl:value-of select="//label[key='address_of_external_smtp']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='smtp_username']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_smtp_user]" size="25" maxlength="50" value="{//board_config/o_smtp_user}" />

                                    <span><xsl:value-of select="//label[key='username_for_smtp_server']/value"/> <strong><xsl:value-of select="//label[key='do_not']/value"/></strong> <xsl:value-of select="//label[key='require_auth']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='smtp_password']/value"/></th>
                                <td>

                                    <input type="text" name="form[o_smtp_pass]" size="25" maxlength="50" value="{//board_config/o_smtp_pass}" />
                                    <span><xsl:value-of select="//label[key='password_for_smtp_server']/value"/> <strong><xsl:value-of select="//label[key='do_not']/value"/></strong> <xsl:value-of select="//label[key='require_auth']/value"/>.</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>

            </div>
            <div class="inform">
                <fieldset>
                    <legend><xsl:value-of select="//label[key='registration']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='allow_new_registration']/value"/></th>

                                <td>
                                    <input type="radio" name="form[o_regs_allow]" value="" /><strong><xsl:value-of select="//label[key='no']/value"/></strong>
                                    <span><xsl:value-of select="//label[key='controls_whether_forum_accepts_new_registration']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='verify_registrations']/value"/></th>

                                <td>
                                    <input type="radio" name="form[o_regs_verify]" value="" /><strong><xsl:value-of select="//label[key='no']/value"/></strong>
                                    <span><xsl:value-of select="//label[key='when_enabled_users_are_emailed']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='use_forum_rules']/value"/></th>

                                <td>
                                    <input type="radio" name="form[o_rules]" value="" /><strong><xsl:value-of select="//label[key='no']/value"/></strong>
                                    <span><xsl:value-of select="//label[key='when_enabled_users_must']/value"/>.</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="//label[key='rules']/value"/></th>

                                <td>
                                    <textarea name="form[o_rules_message]" rows="10" cols="55"><xsl:value-of select="//label[key='enter_rules_here']/value"/>.</textarea>
                                    <span><xsl:value-of select="//label[key='here_you_can_enter_any_rules']/value"/>.</span>
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
