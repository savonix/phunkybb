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
<xsl:include href="main.xsl"/>
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">
<div id="adminconsole" class="block2col">
    <xsl:call-template name="admin-menu"/>
	<div class="block">
		<h2 class="block2"><span><xsl:value-of select="//label[key='statistics']/value"/></span></h2>
		<div id="adstats" class="box">
			<div class="inbox">
				<dl>
					<dt>PhunkyBB <xsl:value-of select="//label[key='version']/value"/></dt>
					<dd>
						PhunkyBB 0.2<br/>
                        <xsl:value-of select="//label[key='copyright']/value"/>
					</dd>
					<dt><xsl:value-of select="//label[key='enviornment']/value"/></dt>
					<dd>
						<xsl:value-of select="//label[key='operating_system']/value"/>: <br/>
						PHP: <br/>
						<xsl:value-of select="//label[key='accelerator']/value"/>: <a href="http://xcache.lighttpd.net/">XCache</a>
					</dd>
					<dt><xsl:value-of select="//label[key='database']/value"/></dt>
					<dd>
                        MySQL
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="clearer"></div>
</div>
</xsl:template>
</xsl:stylesheet>
