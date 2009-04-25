<!--
Program: PhunkyBB
Component: profile.xsl
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
    <!-- User Profile Nodeset -->
    <xsl:variable name="my_user" select="/_R_/user_get_profile/user_get_profile"/>

    <div class="blockform">
      <h2>
        <xsl:value-of select="$my_user/username"/> -
        <xsl:value-of select="$my18n/essentials"/>
      </h2>
      <div class="box">
        <xsl:if test="//_get/user_id and /_R_/runtime/group_id=1">
          <input type="hidden" name="user_id" value="{//_get/user_id}"/>
        </xsl:if>
        <xsl:if test="not(//_get/user_id) or not(/_R_/runtime/group_id=1)">
          <input type="hidden" name="user_id" value="{//runtime/user_id}"/>
        </xsl:if>
        <div class="inform">
        </div>
      </div>
    </div>

	</xsl:template>
</xsl:stylesheet>
