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
    background: #F2E5B8;
    color: #333;
}


/* The following is obviously punbb */
/****************************************************************/
/* 1. BACKGROUND AND TEXT COLOURS */
/****************************************************************/

/* 1.1 Default background colour and text colour */

BODY {BACKGROUND-COLOR: #FFF}

.pun {COLOR: #333}

DIV.box, .pun BLOCKQUOTE, DIV.codebox, #adminconsole FIELDSET TH, .rowodd, .roweven {BACKGROUND-COLOR: #F1F1F1}
#adminconsole TD, #adminconsole TH {BORDER-COLOR: #F1F1F1}

/* 1. 2 Darker background colours */

TD.tc2, TD.tc3, TD.tcmod, #postpreview, #viewprofile DD, DIV.forminfo,
#adminconsole FIELDSET TD, DIV.blockmenu DIV.box, #adstats DD {BACKGROUND-COLOR: #DEDFDF}

/* 1.3 Main headers and navigation bar background and text colour */

.pun H2, #brdmenu {BACKGROUND-COLOR: #0066B9; COLOR: #FFF}

/* 1.4 Table header rows */

.pun TH {BACKGROUND-COLOR: #D1D1D1}

/* 1.5 Fieldset legend text colour */

.pun LEGEND {COLOR: #005CB1}

/* 1.6 Highlighted text for various items */

.pun DIV.blockmenu LI.isactive A, #posterror LI STRONG {COLOR: #333}

/****************************************************************/
/* 2. POST BACKGROUNDS AND TEXT */
/****************************************************************/

/* 2.1 This is the setup for posts. */

DIV.blockpost DIV.box, DIV.postright, DIV.postfootright {BACKGROUND-COLOR: #DEDFDF}
DIV.postright, DIV.postfootright {BORDER-LEFT-COLOR: #f1f1f1}
DIV.postleft, DIV.postfootleft, DIV.blockpost LABEL {BACKGROUND-COLOR: #F1F1F1}

/* 2.2 Background for post headers and text colour for post numbers in viewtopic */

DIV.blockpost H2 {BACKGROUND-COLOR: #006FC9}
DIV.blockpost H2 SPAN.conr {COLOR: #AABDCD}

/* 2.3 This is the line above the signature in posts. Colour and background should be the same */

.pun HR {BACKGROUND-COLOR: #333; COLOR: #333}

/****************************************************************/
/* 3. BORDER COLOURS */
/****************************************************************/

/* 3.1 All external borders */

DIV.box {BORDER-COLOR: #0066B9}

/* 3.2 Makes the top border of posts match the colour used for post headers */

DIV.blockpost DIV.box {BORDER-COLOR: #006fC9 #0066B9 #0066B9}

/* 3.3 Table internal borders. By default TH is same as background so border is invisible */

.pun TD {BORDER-COLOR: #BBCEDE}
.pun TH {BORDER-COLOR: #D1D1D1}

/* 3.4 Creates the inset border for quote boxes, code boxes and form info boxes */

.pun BLOCKQUOTE, DIV.codebox, DIV.forminfo, DIV.blockpost LABEL {BORDER-COLOR: #ACA899 #FFF #FFF #ACA899}

/* 3.5 Gecko's default fieldset borders are really nasty so this gives them a colour
without interferring with IE's rather nice default */

.pun DIV>FIELDSET {BORDER-COLOR: #ACA899}

/****************************************************************/
/* 4. LINK COLOURS */
/****************************************************************/

/* 4.1 This is the default for all links */

.pun A:link, .pun A:visited {COLOR: #005CB1}
.pun A:hover {COLOR: #B42000}

/* 4.2 This is the colour for links in header rows and the navigation bar */

.pun H2 A:link, .pun H2 A:visited, #brdmenu A:link, #brdmenu A:visited {
    COLOR: #FFF;
    padding: 4px;
}
.pun H2 A:hover, #brdmenu A:hover {COLOR: #FFF}

/* 4.3 This is for closed topics and "hot" links */

LI.postreport A:link, LI.postreport A:visited, TR.iclosed TD.tcl A:link, TR.iclosed TD.tcl A:visited {COLOR: #888}
LI.postreport A:hover, TR.iclosed TD.tcl A:hover {COLOR: #AAA}
LI.maintenancelink A:link, LI.maintenancelink A:visited {COLOR: #B42000}
LI.maintenancelink A:hover {COLOR: #B42000}

/****************************************************************/
/* 5. POST STATUS INDICATORS */
/****************************************************************/

/* These are the post status indicators which appear at the left of some tables. 
.inew = new posts, .iredirect = redirect forums, .iclosed = closed topics and
.isticky = sticky topics. The default is "icon". By default only .inew is different.*/

DIV.icon {BORDER-COLOR: #E6E6E6 #DEDEDE #DADADA #E2E2E2}
TR.iredirect DIV.icon {BORDER-COLOR: #F1F1F1 #F1F1F1 #F1F1F1 #F1F1F1}
DIV.inew {BORDER-COLOR: #0080D7 #0065C0 #0058B3 #0072CA}


</xsl:template>
</xsl:stylesheet>