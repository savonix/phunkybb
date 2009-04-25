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

div.blocktable, div.block, div.blockform, div.block2col {
	margin-bottom: 2px;
}

#brdtitle {
  min-height:6em;
  padding:10px;
}
#brdtitle p {
	padding-top: 0px;
}
#brdtitle h2 {
  line-height:1.9em;
}
.tableframe {
  padding: 6px;
  position: absolute;
  top: 142px;
  left: 10px;
  right: 10px;
  bottom: 60px;
  background-color: #fff;
  overflow: auto;
  border: 1px;
  border-style: solid;
  border-color: #aaa;
  <xsl:if test="//browser='msie'">
  /* css hack for IE */
  width: expression((parseInt(document.documentElement.clientWidth)-230)+'px');
  height: expression((parseInt(document.documentElement.clientHeight)-125)+'px');
  </xsl:if>
}

#quickpost {
  display: none;
  position: absolute;
  top: 80px;
  left: 240px;
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
  border-bottom:0;
}


#punindex div.blocktable{
	margin-bottom: 6px;
}

div.blockpost input, div.blockpost label {
	padding: 3px;
	display: block;
}

div.blockpost {
  padding: 6px;
	margin-bottom: 1em;
}
div.postmsg {
  min-height: 120px;
	display: block;
}
div.postmsgsig {
text-align: right;
  line-height: 2em;
}

div.inform {
	padding: 12px;
}

.user_avatar {
float:left; margin-right: 10px;
background-color:#aaa;
height:50px;width:50px;
text-align:center;
cursor: pointer;
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
div.rbox input, div.blockform p input {
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


.interstatus
{
  padding: .2em .4em;
  border-style: solid;
  border-width: 1px;
  border-color: red;
}


.pun h2 a:link, #brdmenu a {
    padding: 3px;
}

h2.topic_h2 {
	font-size: .8em;
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

img {
    border: 0;
}

table
{
    border-spacing: 0;
    border-collapse: collapse;
}

td
{
    text-align: left;
    font-weight: normal;
}

input.text
{
    padding: 2px;
    border: 1px solid #999999;
}

input.textarea
{
    padding: 2px;
    border: 1px solid #999999;
}
</xsl:template>
</xsl:stylesheet>
