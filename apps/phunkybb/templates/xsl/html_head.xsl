<!--
Program: PhunkyBB
Component: html_head.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="head">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">head</xsl:with-param>
    </xsl:call-template>

    <head>
			<xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
					<meta name="description" content="{/_R_/forum_get_by_id/forum_get_by_id/forum_name}: {/_R_/topic_get_by_id/topic_get_by_id/subject}"/>
			</xsl:if>
			<xsl:if test="not(/_R_/forum_get_by_id/forum_get_by_id/forum_name)">
					<meta name="description" content="{/_R_/board_config/o_board_title}"/>
			</xsl:if>
		  <title>
        <xsl:value-of select="/_R_/board_config/o_board_title"/>
        <xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
					<xsl:text>: </xsl:text>
					<xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
        </xsl:if>
        <xsl:if test="/_R_/topic_get_by_id/topic_get_by_id/subject">
					<xsl:text>: </xsl:text>
					<xsl:value-of select="/_R_/topic_get_by_id/topic_get_by_id/subject"/>
        </xsl:if>
      </title>
			<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"/>
      <link rel="stylesheet" type="text/css" href="{$link_prefix}dynamic-css"/>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/jquery.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.disabletextselect.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jsval.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/time/relative_time.js"></script>
      <xsl:for-each select="/_R_/in_head">
        <xsl:sort select="priority"/>
        <xsl:value-of select="string" disable-output-escaping="yes"/>
      </xsl:for-each>
    </head>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">head</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
