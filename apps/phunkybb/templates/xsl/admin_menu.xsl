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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:template name="admin-menu">
<div id="adminmenu" class="blockmenu">
    <h2><span><xsl:value-of select="//label[key='admin_menu']/value"/></span></h2>
    <div class="box">
        <div class="inbox">
        <ul>
            <xsl:for-each select="//navigation/admin_menu/button">
                <xsl:variable name="mykey"><xsl:value-of select="."/></xsl:variable>
                <li><a href="{//link_prefix}{$mykey}"><xsl:value-of select="//label[key=$mykey]/value"/></a></li>
            </xsl:for-each>
        </ul>
        </div>
    </div>
</div>
</xsl:template>
</xsl:stylesheet>
