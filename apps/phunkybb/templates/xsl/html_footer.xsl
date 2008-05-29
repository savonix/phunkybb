<!--
Program: PhunkyBB
Component: footer.xsl
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
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="footer">
<xsl:param name="link_prefix"/>

<xsl:param name="path_prefix"/>
<xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">header</xsl:with-param>
</xsl:call-template>
<footer>
<div id="brdfooter" class="block">
	<h2>Board footer</h2>
	<div class="box">
		<div class="inbox">
			<dl id="searchlinks" class="conl">
			</dl>
			<p class="conr">Powered by <a href="http://www.phunkybb.docunext.com/blog/">PhunkyBB</a>, a fork of punbb.
            <xsl:if test="/_R_/runtime/svn_revision">
                Revision <xsl:value-of select="/_R_/runtime/svn_revision"/>
            </xsl:if>
            </p>
		</div>
	</div>
</div>
</footer>
<xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">header</xsl:with-param>
</xsl:call-template>
</xsl:template>
</xsl:stylesheet>
