<!--
Program: PhunkyBB
Component: admin.xsl
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
<xsl:param name="my18n"/>
<div id="adminconsole" class="block2col">
<xsl:call-template name="admin-menu">
    <xsl:with-param name="link_prefix">
        <xsl:value-of select="$link_prefix"/>
    </xsl:with-param>
    <xsl:with-param name="my18n" select="$my18n"/>
</xsl:call-template>

	<div class="block">
		<h2 class="block2"><xsl:value-of select="$my18n/s/statistics"/></h2>
		<div id="adstats" class="box">
			<div class="inbox">
				<dl>
					<dt>PhunkyBB <xsl:value-of select="$my18n/v/version"/></dt>
					<dd>
						PhunkyBB 0.2<br/>
            <xsl:value-of select="$my18n/c/copyright"/>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
</xsl:template>
</xsl:stylesheet>
