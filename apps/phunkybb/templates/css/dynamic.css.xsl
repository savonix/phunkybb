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
but WITHOUT ANY WARRANTY; without even the implied warranty of
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

.tcl {text-align: left; width: 50%}

.tc2, .tc3, .tcmod {width: 9%; text-align: center}

.tcr {width: 32%; text-align: left}

#punsearch #vf .tcl, #punmoderate #vf .tcl {width: 41%}

#punsearch #vf .tc2 {width: 18%; text-align: left}

.tcl, .tcr {overflow: HIDDEN}


#users1 .tcl {width: 40%}

#users1 .tcr {width: 25%}

#users1 .tc2 {width: 25%; text-align: left}

#users1 .tc3 {width: 10%; text-align: center}

#debug .tcr {width: 85%; white-space: normal}

#punindex TD.tcr SPAN.byuser {display: block}


#adminconsole .block2 {margin-top: 12px}

* HTML #adstats DD {HEIGHT: 1%}
#adstats DD {margin-left: 14em; padding: 3px; margin-bottom: 5px; liNE-HEIGHT: 1.5em}
#adstats dt {float:left; width: 13em; padding: 3px; line-height: 1.5em}
#adstats {padding: 15px 15px 5px 10px}
#adintro {padding: 5px}
#adintro P {padding: 10px}
#adstats DL {padding: 5px 0 10px 5px}

#adminconsole fieldset TD {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset TH {text-align: left; padding: 4px; white-space: normal}
#adminconsole fieldset TD SPAN, #adminconsole fieldset TH SPAN {display: block; FONT-SIZE: 1em; FONT-WEIGHT: normal}
#adminconsole TH {width: 15em; FONT-WEIGHT: bold}
#adminconsole INPUT, #adminconsole SELECT, #adminconsole textAREA {margin-bottom: 0; margin-top: 0; FONT-WEIGHT: normal}
#adminconsole table.aligntop TH, #adminconsole table.aligntop TD {VERTICAL-align: top}
#adminconsole table.aligntop TH {padding-top: 0.7em}
#adminconsole TD, #adminconsole TH {border-style: solid; border-width: 3px 0px 3px 0px}
#adminconsole P {padding-bottom: 6px}
#adminconsole .topspace {padding-top: 6px}
#adminconsole P.submittop, #adminconsole P.submitend {text-align: center}
#adminconsole TH.hidehead {color: #f1f1f1}
#adminconsole THEAD TH {padding-bottom: 0px}
#adminconsole P.linkactions {FONT-WEIGHT: bold; padding-left: 5px}
#adminconsole TH INPUT, #adminconsole div.fsetsubmit {margin-top: 6px}



.pun, .pun INPUT, .pun SELECT, .pun textAREA, .pun OPTGROUP {
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}

.pun {FONT-SIZE: 11px; liNE-HEIGHT: normal}

.pun table, .pun INPUT, .pun SELECT, .pun OPTGROUP, .pun textAREA, div.postmsg P.postedit {FONT-SIZE: 1em}


.pun PRE {FONT-FAMILY: monaco, "Bitstream Vera Sans Mono", "Courier New", courier, monospace}


.pun h2, .pun H4 {FONT-SIZE: 1em}
.pun h3 {FONT-SIZE: 1.1em}
#brdtitle H1 {FONT-SIZE: 1.4em}


div.postmsg P {liNE-HEIGHT: 1.4}
div.postleft dt {FONT-SIZE: 1.1em}
.pun PRE {FONT-SIZE: 1.2em}


div.postleft dt, div.postmsg H4, TD.tcl h3, div.forminfo h3, P.postlink, div.linkst li,
div.linksb li, div.postlinksb li, .blockmenu li, #brdtitle H1, .pun SPAN.warntext, .pun P.warntext {FONT-WEIGHT: bold}



#brdmenu A:link, #brdmenu A:visited, .blockpost dt A:link, .blockpost dt A:visited, .blockpost h2 A:link,
.blockpost h2 A:visited, .postlink A:link, .postlink A:visited, .postfootright A:link, .postfootright A:visited,
.blockmenu A:link, .blockmenu A:visited {
	text-decoration: none
}


#brdmenu A:hover, .blockpost h2 A:hover {text-decoration: underline}


div.box, .pun TD, .pun TH, .pun blockquote, div.codebox, div.forminfo, div.blockpost label {
	border-style: solid;
	border-width: 1px
}





.pun TD, .pun TH {
	border-bottom: none;
	border-right: none
}

.pun .tcl {border-left: none}


div>fieldset {
	border-style: solid;
	border-width: 1px
}


#punwrap {margin:12px 20px}


div.blocktable, div.block, div.blockform, div.block2col, #postreview {margin-bottom: 12px}
#punindex div.blocktable, div.blockpost {margin-bottom: 6px}
div.block2col div.blockform, div.block2col div.block {margin-bottom: 0px}


div.linkst, div.linksb {margin-top: -12px}
div.postlinksb {margin-top: -6px}


#brdstats {margin-top: 12px}


div.block div.inbox, div.blockmenu div.inbox {padding: 3px 6px}
.pun P, .pun UL, .pun DL, div.blockmenu li, .pun label, #announce div.inbox div {padding: 3px 0}
.pun h2 {padding: 4px 6px}

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

.pun H1 {padding: 3px 0px 0px 0}
#brdtitle P {padding-top: 0px}
div.linkst {padding: 8px 6px 3px 6px}
div.linksb, div.postlinksb {padding: 3px 6px 8px 6px}
#brdwelcome, #brdfooter DL A, div.blockmenu li, div.rbox INPUT  {liNE-HEIGHT: 1.4em}
#viewprofile dt, #viewprofile DD {padding: 0 3px; liNE-HEIGHT: 2em}


#brdmenu li, div.rbox INPUT, div.blockform P INPUT  {margin-right: 12px}


.pun TH, .pun TD {padding: 4px 6px}
.pun TD P {padding: 5px 0 0 0}


div.postleft DL, div.postright {padding: 6px}


DD.usercontacts, DD.postavatar {margin-top: 5px}
DD.postavatar {margin-bottom: 5px}


div.postsignature, div.postmsg P.postedit {padding-top: 15px}


div.postmsg H4 {margin-bottom: 10px}
.pun blockquote, div.codebox {margin: 5px 15px 15px 15px; padding: 8px}


div.postfootleft P, div.postfootright UL, div.postfootright div {padding: 10px 6px 5px 6px}


div.blockpost INPUT, div.blockpost label {
	padding: 3px;
	display: inline
}

P.multidelete {
	padding-top: 15px;
	padding-bottom: 5px
}


div.postmsg P {padding: 0}


div.blockform form, div.fakeform {padding: 20px 20px 15px 20px}
div.inform {padding-bottom: 12px}


.pun fieldset {padding: 0px 12px 0px 12px}
div.infldset {padding: 9px 0px 12px 0}
.pun legend {padding: 0px 6px}

div.forminfo {
	margin-bottom: 12px;
	padding: 9px 10px
}



div.blockform P INPUT {margin-left: 12px}


div.icon {
	float: left;
	margin-top: 0.1em;
	margin-left: 0.2em;
	display: block;
	border-width: 0.6em 0.6em 0.6em 0.6em;
	border-style: solid
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
    margin: .5em;
    cursor: pointer;
}
</xsl:template>
</xsl:stylesheet>