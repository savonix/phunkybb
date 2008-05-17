<!--
Program: PhunkyBB
Component: html_shell.xsl
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
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="no"
doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html>
<head>
    <title>
        <xsl:value-of select="/__ROOT__/board_config/o_board_title"/>
        <xsl:if test="//forum_get_by_id/forum_name">
            : <xsl:value-of select="//forum_get_by_id/forum_name"/>
        </xsl:if>
        <xsl:if test="//topic_get_by_id/subject">
            : <xsl:value-of select="//topic_get_by_id/subject"/>
        </xsl:if>
    </title>
    <link rel="stylesheet" type="text/css" href="s/style/Oxygen.css"/>
    <xsl:if test="//runtime/username">
    <link rel="stylesheet" type="text/css" href="s/style/imports/base_admin.css"/>
    </xsl:if>
    <link rel="stylesheet" type="text/css" href="{//link_prefix}dynamic-css"/>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.cookiejar.js"></script>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.dimensions.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.date_input.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.cookie.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.json.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.tablesorter.cookie.js"></script>
    <script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jsval.js"></script>
<xsl:for-each select="//in_head">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</head>
<body>
<xsl:for-each select="//pre_body_content">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>


<xsl:call-template name="main"/>



<xsl:for-each select="//footer">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
