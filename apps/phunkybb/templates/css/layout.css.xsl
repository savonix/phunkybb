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

<xsl:if test="contains(//user_agent,'msie')">
body {
  text-align: center;
}
</xsl:if>
#main {
  width: 70%;
  margin-left: auto;
  margin-right: auto;
  <xsl:if test="contains(//user_agent,'msie')">
  text-align: left;
  </xsl:if>
}

.breadcrumbs {
  float: left;
}
.breadcrumbs li, .breadcrumbs li h1, .breadcrumbs li h2 {
  display: inline;
}

.post {
  margin: 0 10px 2em 10px;
  display: block;
  clear: both;
}
.post-meta {
  text-align: left;
  margin-bottom: 3px;
  margin-left: 60px;
  border-bottom-style: dotted;
  border-bottom-width: 1px;
}
.post-message {
  margin-left: 60px;
}
.post-controls {
  float: right;
}
.post-avatar {
  width:50px;
  height:50px;
}
.usermeta {
  text-align: right;
}

.user-avatar {
float: left;
margin-right: 10px;
height:50px;
width:50px;
text-align:center;
cursor: pointer;
}

#header-title {
  min-height:6em;
  padding:10px;
}
#header-title p {
	padding-top: 0px;
}

#header-banner {
position:absolute;right: 50px; top:40px;
}

.tableframe, .tableframe2 {
  width: 70%;
  margin-left: auto;
  margin-right: auto;
  padding: 6px;
  position: absolute;
  top: 142px;
  bottom: 60px;
  background-color: #fff;
  <xsl:if test="contains(//user_agent,'msie')">
  overflow-x: hidden;
  overflow-y: scroll;
  </xsl:if>
  overflow: auto;
  border: 1px;
  border-style: solid;
  border-color: #aaa;
}
.tableframe2 {
  top: 120px;
  left: 360px;
  bottom: 50px;
}

#quickpost {
  display: none;
  position: absolute;
  top: 80px;
  left: 240px;
  background-color: #F9F9F9;
  overflow: auto;
  <xsl:if test="contains(//user_agent,'msie')">
  /* css hack for IE */
  width: expression((parseInt(document.documentElement.clientWidth)-230)+'px');
  height: expression((parseInt(document.documentElement.clientHeight)-125)+'px');
  </xsl:if>
}


#footer {
  position: absolute;
  bottom: 0px;
  left: 10px;
  right: 10px;
  padding: 0 10px;
  margin-left: auto;
  margin-right: auto;
	border-style: solid;
	border-width: 1px;
  border-bottom:0;
}
#footer p {
  width: 100%;
  text-align: right;
}





.interstatus
{
  padding: .2em .4em;
  border-style: solid;
  border-width: 1px;
  border-color: red;
}

#main-menu {
  padding: 2px;
}

#main-menu a {
	line-height: 2em;
  padding: 3px;
}

.col-left {
  width: 20em;
}

.col-1, .col-2 {
width: 4em;
}
</xsl:template>
</xsl:stylesheet>
