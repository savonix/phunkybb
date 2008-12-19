<!--
Program: PhunkyBB
Component: layout.css.xsl
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
<xsl:template name="layout">

#main {
  width: 100%;
  text-align: left;
  margin-left: auto;
  margin-right: auto;
}

.postleft {
	padding: 4px;
	float: left;
}

.pun p, .pun ul, .pun dl, div.blockmenu li, .pun label, #announce div.inbox div {
	padding: 3px 0;
}

div.block div.inbox, div.blockmenu div.inbox {
	padding: 3px 6px;
}


.pun h1 {
	padding: 3px 0px 0px 0;
}

.pun h2 {
	padding: 4px 6px;
}

div.blocktable, div.block, div.blockform, div.block2col, #postreview {
	margin-bottom: 12px;
}

#brdtitle p {
	padding-top: 0px;
}

div.linkst {
	padding: 8px 6px 3px 6px;
}
div.linksb, div.postlinksb {
	padding: 3px 6px 8px 6px;
}
#brdwelcome, #brdfooter DL A, div.blockmenu li, div.rbox input  {
	line-height: 1.4em;
}
#viewprofile dt, #viewprofile dd {
	padding: 0 3px;
	line-height: 2em;
}

#punindex div.blocktable, div.blockpost {
	margin-bottom: 6px;
}

div.icon {
	float: left;
	margin: .1em;
	margin-right: .5em;
	display: block;
	border-width: 0.6em 0.6em 0.6em 0.6em;
	border-style: solid;
}

div.postfootleft p, div.postfootright ul, div.postfootright div {
	padding: 10px;
}

.blocktable h2 {
	border-width: 1px;
	border-bottom-width: 0;
	border-style: solid;
	margin-top: .8em;
}


.interstatus
{
    padding: .2em .4em;
    border-style: solid;
    border-width: 1px;
    border-color: red;
}

#brdheader div.box {border-top-width: 4px}

.pun H2 A:link, .pun H2 A:visited, #brdmenu A:link, #brdmenu A:visited {
    padding: 4px;
}

h3, .tclcon {
	text-indent: 4px;
}
</xsl:template>
</xsl:stylesheet>
