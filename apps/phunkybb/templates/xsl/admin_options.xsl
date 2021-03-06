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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:include href="html_main.xsl"/>
  <xsl:include href="admin_menu.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>
    <div id="adminconsole" class="block2col">
      <xsl:call-template name="admin-menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>


      <div class="tableframe2">
        <h2>
          <xsl:value-of select="$my18n/options"/>
        </h2>
        <div class="box">
          <form method="post" action="{$link_prefix}admin-options-submit">
            <p class="submittop">
              <input type="submit" name="save" value="Save Changes"/>
            </p>
            <div class="inform">
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/essentials"/>
                </legend>
                <div class="infldset">
                  <table class="aligntop" cellspacing="0">
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/board_title"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_board_title]" value="{//site_config/o_board_title}"/>
                        <xsl:value-of select="$my18n/title_of_buletine_board"/>
                        <strong>
                          <xsl:value-of select="$my18n/not"/>
                        </strong>
                        <xsl:value-of select="$my18n/contain_html"/>.
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/board_description"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_board_desc]" value="{//site_config/o_board_desc}"/>
                        <xsl:value-of select="$my18n/short_description_of_this"/>.
											</td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/base_url"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_base_url]" value="{//site_config/o_base_url}"/>
											</td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/anonymous_posts"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_anonymous_posts]" value="{//site_config/o_anonymous_posts}"/>
											</td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/anonymous_replies"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_anonymous_replies]" value="{//site_config/o_anonymous_replies}"/>
											</td>
                    </tr>
                  </table>
                </div>
              </fieldset>
            </div>
            <div class="inform">
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/email"/>
                </legend>
                <div class="infldset">
                  <table class="aligntop" cellspacing="0">
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/admin_email"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_admin_email]" value="{//site_config/o_admin_email}"/>
                        <xsl:value-of select="$my18n/email_of_forum_admin"/>.
                                </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/webmaster_email"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_webmaster_email]" value="{//site_config/o_webmaster_email}"/>
                        <br/>
                        <xsl:value-of select="$my18n/address_all_email_sent_from"/>.
											</td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/smtp_server_address"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_smtp_host]" value="{//site_config/o_smtp_host}"/>
                        <xsl:value-of select="$my18n/address_of_external_smtp"/>.
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/smtp_username"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_smtp_user]" value="{//site_config/o_smtp_user}"/>
                        <xsl:value-of select="$my18n/username_for_smtp_server"/>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/smtp_password"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_smtp_pass]" value="{//site_config/o_smtp_pass}"/>
                        <xsl:value-of select="$my18n/password_for_smtp_server"/>
                      </td>
                    </tr>
                  </table>
                </div>
              </fieldset>
            </div>
            <div class="inform">
              <fieldset>
                <legend>
                  Look and Feel
                </legend>
                <div class="infldset">
                  <table class="aligntop" cellspacing="0">
                    <tr>
                      <th scope="row">
                        Theme file:
                      </th>
                      <td>
                        <select name="form[o_board_theme]">
                          <xsl:for-each select="//css_files/css_files/filename">
                          <option value="{.}">
                            <xsl:value-of select="@nicename"/>
                          </option>
                          </xsl:for-each>
                        </select>
                        <xsl:value-of select="/_R_/site_config/o_board_theme"/>
                      </td>
                    </tr>
                  </table>
                </div>
              </fieldset>
            </div>
						<div class="inform">
              <fieldset>
                <legend>
                  Miscellaneous
                </legend>
                <div class="infldset">
                  <table class="aligntop" cellspacing="0">
                    <tr>
                      <th scope="row">
                        Google Analytics Code:
                      </th>
                      <td>
                        <input type="text" name="form[o_google_analytics_code]" value="{//site_config/o_google_analytics_code}"/>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        File Upload Directory:
                      </th>
                      <td>
                        <input type="text" name="form[o_upload_directory]" value="{//site_config/o_upload_directory}"/>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        Upload Access Directory:
                      </th>
                      <td>
                        <input type="text" name="form[o_access_directory]" value="{//site_config/o_access_directory}"/>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/extra_menu_items"/>
                      </th>
                      <td>
                        <input type="text" name="form[o_extra_menu_items]"
													value="{//site_config/o_extra_menu_items}" size="45"/>
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
    <script type="text/javascript">
      $("option[value='<xsl:value-of select="/_R_/site_config/o_board_theme"/>']").attr("selected","selected");
    </script>

  </xsl:template>
</xsl:stylesheet>
