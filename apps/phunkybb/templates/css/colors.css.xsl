<!--
Program: PhunkyBB
Component: colors.css.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:template name="colors">
html, body {
  background: <xsl:value-of select="//css/colors/background"/>;
  color: #333;
}


.postmeta {
  border-color: #ddd;
}
div.icon {
	border-color: #E6E6E6 #DEDEDE #DADADA #E2E2E2
}

div.inew {
	border-color: #0080D7 #0065C0 #0058B3 #0072CA
}


#main-menu a {
	color: <xsl:value-of select="//css/colors/bright-highlight"/>;
}



#footer {
background-color: <xsl:value-of select="//css/colors/med-background-alt"/>;
}


#main-menu, h2.breadcrumbs {
  background-color: <xsl:value-of select="//css/colors/dark-background"/>;
  color: #FFF
}



</xsl:template>
</xsl:stylesheet>