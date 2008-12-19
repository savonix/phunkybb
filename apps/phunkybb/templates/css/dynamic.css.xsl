<!--
Program: PhunkyBB
Component: dynamic.css.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WIthOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABIliTY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:include href="base.css.xsl"/>
<xsl:include href="colors.css.xsl"/>
<xsl:include href="layout.css.xsl"/>
<xsl:include href="typography.css.xsl"/>
<xsl:template match="/">

<xsl:call-template name="base"/>
<xsl:call-template name="typography"/>
<xsl:call-template name="layout"/>
<xsl:call-template name="colors"/>

.infldset table tr td input[type="radio"]
{
    margin: 4px;
}
.infldset input[type="text"]
{
    display: block;
}
.interstatus
{
    visibility: hidden;
    background-color: pink;
    color: red;
    font-weight: bold;
    border-style: solid;
}

.breadcrumbs li {
    display: inline;
}







#brdfooter h2, #brdstats h2, #brdstats .conl dt, #brdstats .conr dt,
#modcontrols dt, #searchlinks dt, div.postright h3 {
	position: absolute;
	display: block;
	overflow: hidden;
	width: 1em;
	left: -999em
}


.conr {
	float: right;
	text-align: right;
	clear: right;
	width: 40%
}

.conl {
	float: left;
	width: 55%;
	overflow: hidden;
	white-space: nowrap
}

label.conl {
	width: auto;
	overflow: visible;
	margin-right: 10px
}


div.linkst .conl, div.linksb .conl, div.postlinksb .conl {width:18em}

div.linkst .conr, div.linksb .conr, div.postlinksb .conr {width:16em}

form div.linksb .conr {width: 32em}

.linkst UL, linksb UL, .postlinksb UL {margin-left: 18em}


div.block2col {padding-bottom: 1px}

div.block2col div.blockform, div.block2col div.block, #viewprofile DD {margin-left: 14em}

div.blockmenu, #viewprofile dt {
	float:left;
	width: 13em
}


#viewprofile DL {float: left; width: 100%; overflow: hidden}

.pun table {width: 100%}


#punindex table, #vf table {table-LAYOUT: fixed}

.tcl {
	width: 50%
}

.tc2, .tc3, .tcmod {width: 9%; text-align: center}

.tcr {width: 32%; text-align: left}

#punsearch #vf .tcl, #punmoderate #vf .tcl {width: 41%}

#punsearch #vf .tc2 {width: 18%; text-align: left}

.tcl, .tcr {
	overflow: hidden;
}



#punindex td.tcr span.byuser {display: block}


#adminconsole .block2 {
	margin-top: 12px;
}

#adminconsole fieldset td {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset th {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset td span, #adminconsole fieldset th span {display: block; font-size: 1em; font-weight: normal}
#adminconsole th {width: 15em; font-weight: bold}
#adminconsole input, #adminconsole select, #adminconsole textarea {margin-bottom: 0; margin-top: 0; font-weight: normal}
#adminconsole table.aligntop th, #adminconsole table.aligntop td {VERTICAL-align: top}
#adminconsole table.aligntop th {padding-top: 0.7em}
#adminconsole td, #adminconsole th {border-style: solid; border-width: 3px 0px 3px 0px}
#adminconsole p {padding-bottom: 6px}
#adminconsole .topspace {padding-top: 6px}
#adminconsole p.submittop, #adminconsole P.submitend {text-align: center}
#adminconsole th.hidehead {color: #f1f1f1}
#adminconsole thEAD th {padding-bottom: 0px}
#adminconsole p.linkactions {font-weight: bold; padding-left: 5px}
#adminconsole th input, #adminconsole div.fsetsubmit {margin-top: 6px}



.pun, .pun input, .pun select, .pun textarea, .pun OPTGROUP {
	font-family: Verdana, Arial, Helvetica, sans-serif
}

.pun {
	font-size: 11px;
	line-height: normal;
}

.pun table, .pun input, .pun select, .pun textarea, div.postmsg P.postedit {
	font-size: 1em;
}




div.postleft dt, div.postmsg H4, td.tcl h3, div.forminfo h3, p.postlink, div.linkst li,
div.linksb li, div.postlinksb li, .blockmenu li, #brdtitle H1, .pun span.warntext, .pun p.warntext {
	font-weight: bold;
}



#brdmenu A:link, #brdmenu A:visited, .blockpost dt A:link, .blockpost dt A:visited, .blockpost h2 A:link,
.blockpost h2 A:visited, .postlink A:link, .postlink A:visited, .postfootright A:link, .postfootright A:visited,
.blockmenu A:link, .blockmenu A:visited {
	text-decoration: none
}


div.box, .pun td, .pun th, .pun blockquote, div.codebox, div.forminfo, div.blockpost label {
	border-style: solid;
	border-width: 1px
}





.pun td, .pun th {
	border-bottom: none;
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
	margin: 12px 20px;
}





div.inbox:after {
  clear: both;
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0.0;
  overflow:hidden;
  visibility: hidden;
}





#brdmenu li, div.rbox input, div.blockform p input {
	margin-right: 12px;
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




div.postsignature, div.postmsg P.postedit {
	padding-top: 15px;
}



.pun blockquote, div.codebox {
	margin: 5px 15px 15px 15px;
	padding: 8px;
}








div.blockform p input {
	margin-left: 12px;
}





<xsl:if test="//path_prefix='/demo/'">
.webads iframe {
    overflow-x: hidden;
    overflow-y: hidden;
}
</xsl:if>

<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-blue</xsl:with-param>
    <xsl:with-param name="background-color">#F1F1F1</xsl:with-param>
    <xsl:with-param name="color">#0066B9</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-green</xsl:with-param>
    <xsl:with-param name="background-color">#66FF99</xsl:with-param>
    <xsl:with-param name="color">#009900</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-black</xsl:with-param>
    <xsl:with-param name="background-color">grey</xsl:with-param>
    <xsl:with-param name="color">black</xsl:with-param>
</xsl:call-template>

</xsl:template>



<xsl:template name="thematic-button">
<xsl:param name="button-name"/>
<xsl:param name="background-color"/>
<xsl:param name="color"/>
.button-<xsl:value-of select="$button-name"/>
{
    padding: .2em .4em;
    background-color: <xsl:value-of select="$background-color"/>;
    color: <xsl:value-of select="$color"/>;
    font-weight: bold;
    border-style: solid;
    border-width: 1px;
    border-color: <xsl:value-of select="$color"/>;
    cursor: pointer;
}
.button-<xsl:value-of select="$button-name"/> a
{
    font-weight: bold;
		text-decoration: none;
}
.button-<xsl:value-of select="$button-name"/> a img
{
	margin-bottom: -3px;
	margin-right: 3px;
}

</xsl:template>
</xsl:stylesheet>