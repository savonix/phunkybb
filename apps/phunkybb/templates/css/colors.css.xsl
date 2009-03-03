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
  background: <xsl:value-of select="//css/colors/background"/>;
  color: #333;
}

div.icon {
	border-color: #E6E6E6 #DEDEDE #DADADA #E2E2E2
}
tr.iredirect div.icon {
	border-color: #F1F1F1 #F1F1F1 #F1F1F1 #F1F1F1
}
div.inew {
	border-color: #0080D7 #0065C0 #0058B3 #0072CA
}

.pun {
  color: #333
}

.pun h2 a:hover, #brdmenu a:hover {
	color: #FFF;
}

.pun h2 a:link, .pun h2 a:visited, #brdmenu a:link, #brdmenu a:visited {
    color: #FFF;
}

div.box, .pun blockquote, div.codebox, fieldset th, .rowodd, .roweven {
background-color: <xsl:value-of select="//css/colors/med-background-alt"/>;
}
#brdfooter {
background-color: <xsl:value-of select="//css/colors/med-background-alt"/>;
}


td.tc2, td.tc3, td.tcmod, #postpreview, #viewprofile dd, div.forminfo,
#adminconsole fieldset td, div.blockmenu div.box, #adstats dd {
  background-color: <xsl:value-of select="//css/colors/light-background-alt"/>;
}

.pun h2, #brdmenu {
  background-color: <xsl:value-of select="//css/colors/dark-background"/>;
  color: #FFF
}
div.blockpost h2 {
  background-color: <xsl:value-of select="//css/colors/dark-background"/>;
}


.pun a:link, .pun a:visited {
  color: #005CB1
}

.pun a:hover {
  color: <xsl:value-of select="//css/colors/header-hover"/>;
}

.pun th {
  background-color: <xsl:value-of select="//css/colors/med-background"/>;
}


.pun legend {
  color: #005CB1
}


.pun div.blockmenu li.isactive a, #posterror li strong {
  color: #333
}
.blocktable h2 {
	border-color: black;
}


</xsl:template>
</xsl:stylesheet>