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
<xsl:param name="link_prefix"/>
<xsl:param name="my18n"/>
  <div id="adminmenu" class="blockmenu">
    <h2>
      <xsl:value-of select="$my18n/admin_menu"/>
    </h2>
    <div class="box">
      <div class="inbox">
      <ul>
        <xsl:variable name="mymenu"
          select="document('../../data/xml/menu.xml')/navigation/admin_menu/button"/>
        <xsl:for-each select="$mymenu">
          <xsl:variable name="mykey">
            <xsl:value-of select="."/>
          </xsl:variable>


          <li>
            <a href="{$link_prefix}{$mykey}">
              <xsl:value-of select="$my18n/*[local-name()=$mykey]"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
      </div>
    </div>
  </div>
</xsl:template>
</xsl:stylesheet>
