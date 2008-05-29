<!--
Program: PhunkyBB
Component: link_builder.xsl
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
    <xsl:template name="link_builder">
    <xsl:param name="link_prefix"/>
        <!-- This will concatenate param / value pairs -->
        <xsl:for-each select="//link_params">
            <!-- param = param name = constant -->
            <!-- value = xpath to value or just plain value = variable -->
            <!-- tokens -->
            <!-- order -->
            <xsl:call-template name="the-concatenator">
                <xsl:with-param name="token">/</xsl:with-param>
                <xsl:with-param name="display-param-names">no</xsl:with-param>
                <xsl:with-param name="appendage">.html</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="the-concatenator">
        <xsl:param name="token"/>
        <xsl:param name="display-param-names">no</xsl:param>
        <xsl:param name="appendage"/>
    </xsl:template>
</xsl:stylesheet>
