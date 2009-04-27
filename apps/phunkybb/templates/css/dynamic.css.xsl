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
<xsl:include href="colors.css.xsl"/>
<xsl:include href="layout.css.xsl"/>
<xsl:include href="typography.css.xsl"/>
<xsl:template match="/">

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
    color: red;
    font-weight: bold;
    border-style: solid;
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



div.linkst .conl, div.linksb .conl, div.postlinksb .conl {width:18em}

div.linkst .conr, div.linksb .conr, div.postlinksb .conr {width:16em}




div.block2col {
	padding-bottom: 1px;
}

div.block2col div.blockform, div.block2col div.block {margin-left: 14em}



.pun table {
  width: 100%
}



.tcl {
	width: 50%
}

.tc2, .tc3, .tcmod {width: 9%; text-align: center}

.tcr {width: 32%; text-align: left}


.tcl, .tcr {
	overflow: hidden;
}



#punindex td.tcr span.byuser {display: block}



#adminconsole fieldset td {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset th {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset td span, #adminconsole fieldset th span {display: block; font-size: 1em; font-weight: normal}
#adminconsole th {width: 15em; font-weight: bold}
#adminconsole input, #adminconsole select, #adminconsole textarea {margin-bottom: 0; margin-top: 0; font-weight: normal}
#adminconsole table.aligntop th, #adminconsole table.aligntop td {VERTICAL-align: top}
#adminconsole td, #adminconsole th {border-style: solid; border-width: 3px 0px 3px 0px}
#adminconsole p {padding-bottom: 6px}
#adminconsole p.submittop, #adminconsole P.submitend {text-align: center}
#adminconsole th.hidehead {color: #f1f1f1}
#adminconsole thead th {padding-bottom: 0px}
#adminconsole p.linkactions {font-weight: bold; padding-left: 5px}


























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