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
<xsl:template name="layout">

#main {
  width: 100%;
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
div.box, .pun td, .pun th, div.forminfo, div.blockpost label {
	border-style: solid;
	border-width: 1px;
}

div.block div.inbox, div.blockmenu div.inbox {
	padding: 3px;
}

.breadcrumbs li {
    display: inline;
}

.pun h1 {
	padding: 3px 0px 0px 0;
}

.pun h2 {
	padding: 4px 6px;
}

div.blocktable, div.block, div.blockform, div.block2col, #postreview {
	margin-bottom: 2px;
}

#brdtitle {
  min-height:6em;
  padding:10px;
}
#brdtitle p {
	padding-top: 0px;
}
#brdtitle span {
  line-height:1.9em;
}
.tableframe {
  position: absolute;
  top: 150px;
  left: 10px;
  right: 10px;
  bottom: 60px;
  background-color: #F9F9F9;
  overflow: auto;
  <xsl:if test="//browser='msie'">
  /* css hack for IE */
  width: expression((parseInt(document.documentElement.clientWidth)-230)+'px');
  height: expression((parseInt(document.documentElement.clientHeight)-125)+'px');
  </xsl:if>
}
div.linkst {
	padding: 6px 4px 1px 4px;
}
div.linksb, div.postlinksb {
	padding: 3px 6px 8px 6px;
}
#brdwelcome, div.blockmenu li, div.rbox input  {
	line-height: 1.4em;
}

#brdfooter {
  position: absolute;
  bottom: 0;
  left: 10px;
  right: 10px;
  padding: 0 10px;
  margin-left: auto;
  margin-right: auto;
	border-style: solid;
	border-width: 1px;
}
#viewprofile dt, #viewprofile dd {
	padding: 0 3px;
	line-height: 2em;
}

#punindex div.blocktable, div.blockpost {
	margin-bottom: 6px;
}

div.blockpost input, div.blockpost label {
	padding: 3px;
	display: inline
}

p.multidelete {
	padding-top: 15px;
	padding-bottom: 5px
}


div.postmsg p {
	margin:10px; min-height:8em;
	padding: 0;
}

div.postmsgsignature {
	padding:10px;
}

div.postmsgctrl {
  padding:8px;
  float:right;
}
div.postmsgfooter {
  background-color: #ddd;
  min-height: 28px;
  border-style: solid;
  border-color: #bbb;
  border-width: 0;
  border-top-width:1px;
}

div.inform {
	padding: 12px;
}


.pun fieldset {
	padding: 0px 12px 0px 12px;
}
div.infldset {
	padding: 9px 0px 12px 0;
}
.pun legend {
	padding: 0px 6px;
}

div.forminfo {
	margin-bottom: 12px;
	padding: 9px 10px
}

div.blockform p input {
	margin-left: 12px;
}
#brdmenu li, div.rbox input, div.blockform p input {
	margin-right: 12px;
}
#brdmenu{
	line-height: 1.8em;
}

.pun th, .pun td {
	padding: 4px 6px;
}

.pun td p {
	padding: 5px 0 0 0;
}

div.postleft dl, div.postright {
	padding: 6px;
}

div.postmsg p.postedit {
	padding-top: 15px;
}

.pun blockquote{
	margin: 5px 15px 15px 15px;
	padding: 8px;
}


.pun td, .pun th {
	border-right: none
}

.pun .tcl {
	border-left: none;
}


div>fieldset {
	border-style: solid;
	border-width: 1px
}


#punwrap {
	margin: 0 10px;
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
}

.blockmenu h2 {
	margin-top: 0;
}

.interstatus
{
  padding: .2em .4em;
  border-style: solid;
  border-width: 1px;
  border-color: red;
}


.pun h2 a:link, .pun h2 a:visited, #brdmenu a:link, #brdmenu a:visited {
    padding: 4px;
}

h3, .tclcon {
	text-indent: 4px;
}
.rssicon {
  float:right;
  padding-left:7px;
  margin-top:-\3px;
}

.float_right {
  float: right;
}
</xsl:template>
</xsl:stylesheet>
