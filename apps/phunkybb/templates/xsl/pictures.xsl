<!--
Program: PhunkyBB
Component: personality.xsl
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
  <xsl:include href="profile_menu.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>
    <div id="profile" class="block2col">
      <xsl:call-template name="profile-menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>
      <div class="tableframe2">
        <h2>
          <xsl:value-of select="/_R_/runtime/username"/>
        </h2>
        <div class="box">
          <form id="profile4" method="post">
            <div class="inform">
              <fieldset>
                <legend>Specify your picture URL</legend>
                <div class="infldset">
									<input type="text" name="picture" value="{/_R_/user_get_profile/user_get_profile/picture}"/>
                </div>
              </fieldset>
							<br/>
							<xsl:if test="/_R_/user_get_profile/user_get_profile/picture">
								<img width="50" height="50" src="{/_R_/user_get_profile/user_get_profile/picture}"/>
							</xsl:if>
							<br/>
							<p>
							You can use a site like <a rel="nofollow" href="http://en.gravatar.com/">Gravatar.com</a> to host your picture.
							</p>
            </div>
            <p class="tcenter">
              <input type="submit" name="update" value="Submit"/>
            </p>
          </form>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
