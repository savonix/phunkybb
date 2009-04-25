<!--
Program: PhunkyBB
Component: admin_menu.xsl
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
	<xsl:template name="admin-menu">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>
		<div class="blockmenu">
			<h2 style="background: #009966; border:0;">
      <!-- this is a test of the nginx rounded gif module.
				<div style="width: 10px; height: 10px; margin-left: -6px; margin-top: -4px; position: absolute;
				background: url(http://dev-91-gl.savonix.com:8080/circles/F1F7C2/009966/10.gif) no-repeat top left;"></div>
        -->
				<span style="margin-left: 4px;"><xsl:value-of select="$my18n/admin_menu"/></span>
			</h2>
			<div class="box">
				<div class="inbox">
					<ul>
						<xsl:variable name="mymenu"
								select="document('../../data/xml/menu.xml')/navigation/admin_menu/button"/>
						<xsl:for-each select="$mymenu">
							<xsl:variable name="mykey" select="."/>

							<li>
								<a href="{$link_prefix}{$mykey}">
									<xsl:value-of select="$my18n/*[local-name()=$mykey]"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</div>
        <select name="site_id" onchange="document.location='{$link_prefix}{//_get/nid}&amp;site_id='+options[selectedIndex].value;">
        <xsl:for-each select="//sites_get_all/sites_get_all">
          <option value="{site_id}">
					<xsl:if test="//runtime/site_id=site_id">
						<xsl:attribute name="selected">selected</xsl:attribute>
					</xsl:if>
          <xsl:value-of select="substring(http_host,0,18)"/>
          </option>
        </xsl:for-each>
        </select>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
