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
<xsl:include href="html_main.xsl"/>
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">
<xsl:param name="link_prefix"/>
<div id="adminconsole" class="block2col">
<xsl:call-template name="admin-menu"/>

<div class="blockform">
    <h2><xsl:value-of select="//i18n/labels/label[key='options']/value"/></h2>
    <div class="box">
        <form method="post" action="{ink_prefix}options-submit">
            <p class="submittop">
                <input type="submit" name="save" value="Save Changes"/>
            </p>
            <div class="inform">
                <fieldset>
                    <legend><xsl:value-of select="//i18n/labels/label[key='essentials']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='board_title']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_board_title]" size="50" maxlength="255" value="{//board_config/o_board_title}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='title_of_buletine_board']/value"/> <strong><xsl:value-of select="/_R_/i18n/label[key='not']/value"/></strong> <xsl:value-of select="/_R_/i18n/label[key='contain_html']/value"/>.
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='board_description']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_board_desc]" size="50" maxlength="255" value="{//board_config/o_board_desc}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='short_description_of_this']/value"/>.
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="inform">
                <fieldset>
                    <legend><xsl:value-of select="/_R_/i18n/label[key='email']/value"/></legend>
                    <div class="infldset">
                        <table class="aligntop" cellspacing="0">
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='admin_email']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_admin_email]" size="50" maxlength="50" value="{//board_config/o_admin_email}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='email_of_forum_admin']/value"/>.
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='webmaster_email']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_webmaster_email]" size="50" maxlength="50" value="{//board_config/o_webmaster_email}"/>
                                    <br/><xsl:value-of select="/_R_/i18n/label[key='address_all_email_sent_from']/value"/>.
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='subscriptions']/value"/></th>
                                <td>
                                    <input type="radio" name="form[o_subscriptions]" value="yes">
                                        <xsl:if test="//board_config/o_subscriptions='yes'">
                                            <xsl:attribute name="checked">true</xsl:attribute>
                                        </xsl:if>
                                    </input>
                                    <strong>Yes</strong>
                                    <br/>
                                    <input type="radio" name="form[o_subscriptions]" value="no">
                                        <xsl:if test="not(//board_config/o_subscriptions='yes')">
                                            <xsl:attribute name="checked">true</xsl:attribute>
                                        </xsl:if>
                                    </input>
                                    <strong>No</strong>
                                    <br/><xsl:value-of select="/_R_/i18n/label[key='enable_users_to_subscribe']/value"/>.
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='smtp_server_address']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_smtp_host]" size="30" maxlength="100" value="{//board_config/o_smtp_host}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='address_of_external_smtp']/value"/>.
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='smtp_username']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_smtp_user]" size="25" maxlength="50" value="{//board_config/o_smtp_user}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='username_for_smtp_server']/value"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><xsl:value-of select="/_R_/i18n/label[key='smtp_password']/value"/></th>
                                <td>
                                    <input type="text" name="form[o_smtp_pass]" size="25" maxlength="50" value="{//board_config/o_smtp_pass}"/>
                                    <xsl:value-of select="/_R_/i18n/label[key='password_for_smtp_server']/value"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
            </div>
            <p class="submitend">
                <input type="submit" name="save" value="Save Changes"/>
            </p>
        </form>
    </div>
</div>
</div>

</xsl:template>
</xsl:stylesheet>
