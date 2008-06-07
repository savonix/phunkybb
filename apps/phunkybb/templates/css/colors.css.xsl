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


.pun {
  color: #333
}

div.box, .pun BLOCKQUOTE, div.codebox, #adminconsole FIELDSET TH, .rowodd, .roweven {
background-color: <xsl:value-of select="//css/colors/med-background-alt"/>;
}

#adminconsole TD, #adminconsole TH {
  border-color: <xsl:value-of select="//css/colors/dark-background"/>
}

TD.tc2, TD.tc3, TD.tcmod, #postpreview, #viewprofile DD, div.forminfo,
#adminconsole FIELDSET TD, div.blockmenu div.box, #adstats DD {
  background-color: <xsl:value-of select="//css/colors/light-background-alt"/>;
}

.pun h2, #brdmenu {
  background-color: <xsl:value-of select="//css/colors/dark-background"/>;
  color: #FFF
}
div.blockpost h2 {
  background-color: <xsl:value-of select="//css/colors/dark-background"/>;
}


.pun a:link, .pun A:visited {
  color: #005CB1
}

.pun a:hover {
  color: <xsl:value-of select="//css/colors/header-hover"/>;
}

.pun th {
  background-color: <xsl:value-of select="//css/colors/med-background"/>;
}


.pun LEGEND {
  color: #005CB1
}


.pun div.blockmenu LI.isactive A, #posterror LI STRONG {
  color: #333
}


</xsl:template>
</xsl:stylesheet>