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
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template name="colors">
html, body {
  background: <xsl:value-of select="/_R_/css/colors/background"/>;
  color: #333;
}


.pun {
  color: #333
}

div.box, .pun blockquote, div.codebox, #adminconsole fieldset th, .rowodd, .roweven {
background-color: <xsl:value-of select="/_R_/css/colors/med-background-alt"/>;
}

#adminconsole tq, #adminconsole th {
  border-color: <xsl:value-of select="/_R_/css/colors/dark-background"/>
}

td.tc2, td.tc3, td.tcmod, #postpreview, #viewprofile dd, div.forminfo,
#adminconsole fieldset td, div.blockmenu div.box, #adstats dd {
  background-color: <xsl:value-of select="/_R_/css/colors/light-background-alt"/>;
}

.pun h2, #brdmenu {
  background-color: <xsl:value-of select="/_R_/css/colors/dark-background"/>;
  color: #FFF
}
div.blockpost h2 {
  background-color: <xsl:value-of select="/_R_/css/colors/dark-background"/>;
}


.pun a:link, .pun a:visited {
  color: #005CB1
}

.pun a:hover {
  color: <xsl:value-of select="/_R_/css/colors/header-hover"/>;
}

.pun th {
  background-color: <xsl:value-of select="/_R_/css/colors/med-background"/>;
}


.pun legend {
  color: #005CB1
}


.pun div.blockmenu li.isactive a, #posterror li strong {
  color: #333
}


</xsl:template>
</xsl:stylesheet>