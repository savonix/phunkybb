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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
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
					<meta name="description" content="{/_R_/site_config/o_board_title}" />
			</xsl:if>

			<xsl:if test="/_R_/_get/nid='login'">
					<meta name="robots" content="noindex, follow"/>
			</xsl:if>
		  <title>
        <xsl:value-of select="/_R_/site_config/o_board_title"/>
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
      <link rel="stylesheet" type="text/css" href="{$link_prefix}x-dynamic-css"/>
      <script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery-1.3.2.min.js"></script>
      <xsl:if test="not(//runtime/user_agent='bot')">
			<script type="text/javascript" src="{$link_prefix}x-xhtml2dom-js"></script>
      </xsl:if>
			<script type="text/javascript" src="{$link_prefix}x-dynamic-js"></script>
      <script type="text/javascript" src="{$path_prefix}s/js/jsval.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/js/time/relative_time.js"></script>
      <script type="text/javascript" src="http://www-b.evenserver.com/s/js/jquery/plugins/jquery.pir.min.js"></script>
			<xsl:if test="//_get/nid='admin-users' or //_get/nid='index' or //_get/nid='forum'">
      <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/jquery.tablesorter.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
			</xsl:if>
			<xsl:if test="//_get/nid='topic'">
				<link rel="stylesheet" type="text/css" href="{$path_prefix}/s/pkgs/shjs-0.6/sh_style.css"/>
				<script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/sh_main.js"></script>
				<script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_xml.js"></script>
				<script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_c.js"></script>
				<script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_sh.js"></script>
				<script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_php.js"></script>
				<script type="text/javascript">
				$(document).ready(function() {
					sh_highlightDocument();
				});
				</script>
			</xsl:if>
      <xsl:if test="contains(/_R_/runtime/user_agent,'msie')">
				<script type="text/javascript">
				$(document).ready(function() {
          $(".tableframe").css("height","280px");
          $(".tableframe").css("width","100%");
				});
				</script>
      </xsl:if>
      <xsl:for-each select="//head_nodes">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
    </head>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">head</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
