<!--
Program: PhunkyBB
Component: main.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="html_shell.xsl"/>
<xsl:include href="main_menu.xsl"/>
<xsl:template name="main">
<div id="punwrap">
<div id="" class="pun">
<xsl:call-template name="main-menu"/>

<div id="" class="blocktable">
    <xsl:call-template name="content"/>
</div>

<div id="brdfooter" class="block">
	<h2><span>Board footer</span></h2>
	<div class="box">
		<div class="inbox">
			<dl id="searchlinks" class="conl">
			</dl>
			<p class="conr">Powered by <a href="http://www.phunkybb.docunext.com/blog/">PhunkyBB</a>, a fork of punbb.
            <xsl:if test="//runtime/svn_revision">
                Revision <xsl:value-of select="//runtime/svn_revision"/>
            </xsl:if>
            </p>
			<div class="clearer"></div>
		</div>
	</div>
</div>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
