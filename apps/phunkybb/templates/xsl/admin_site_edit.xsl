<!--
Program: PhunkyBB
Component: admin_site_edit.xsl
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

			<div class="blockform">
				<h2>Sites</h2>
				<div class="box">
					<form method="post" class="inform">
          <xsl:if test="//_get/site_id">
            <input type="hidden" name="type" value="edit"/>
            <input type="hidden" name="site_id" value="{//_get/site_id}"/>
          </xsl:if>
          <xsl:if test="not(//_get/site_id)">
            <input type="hidden" name="type" value="create"/>
          </xsl:if>
					This page is for editing a site.
          <input type="text" name="http_host" value="{//sites_get_all/sites_get_all/http_host}"/>
          <input type="submit"/>
					</form>
        </div>
      </div>

		<div class="block" style="clear: both;">
		</div>
    </div>
	</xsl:template>
</xsl:stylesheet>
