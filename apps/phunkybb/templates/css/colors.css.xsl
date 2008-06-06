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
    background: <xsl:value-of select="//css/colors/light-background"/>;
    color: #333
    ;
}

/* The following is obviously punbb */
/****************************************************************/
/* 1. BACKGROUND AND TEXT COLOURS */
/****************************************************************/

/* 1.1 Default background colour and text colour */


.pun {
        COLOR: #333
        }

DIV.box, .pun BLOCKQUOTE, DIV.codebox, #adminconsole FIELDSET TH, .rowodd, .roweven {BACKGROUND-COLOR: #F1F1F1}
#adminconsole TD, #adminconsole TH {
        BORDER-COLOR: <xsl:value-of select="//css/colors/dark-background"/>
        }

/* 1. 2 Darker background colours */

TD.tc2, TD.tc3, TD.tcmod, #postpreview, #viewprofile DD, DIV.forminfo,
#adminconsole FIELDSET TD, DIV.blockmenu DIV.box, #adstats DD {
        BACKGROUND-COLOR: #DEDFDF
        }

/* 1.3 Main headers and navigation bar background and text colour */

.pun H2, #brdmenu {
        BACKGROUND-COLOR: <xsl:value-of select="//css/colors/dark-background"/>; 
        COLOR: #FFF
        }
        
.pun A:link, .pun A:visited {COLOR: #005CB1}
.pun A:hover {COLOR: <xsl:value-of select="//css/colors/header-hover"/>;}

/* 1.4 Table header rows */

.pun TH {
        BACKGROUND-COLOR: #D1D1D1
        }

/* 1.5 Fieldset legend text colour */

.pun LEGEND {
        COLOR: #005CB1
        }

/* 1.6 Highlighted text for various items */

.pun DIV.blockmenu LI.isactive A, #posterror LI STRONG {
        COLOR: #333
        }


</xsl:template>
</xsl:stylesheet>