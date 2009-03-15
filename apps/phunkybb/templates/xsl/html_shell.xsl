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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"
		indent="yes" encoding="UTF-8" omit-xml-declaration="no"
		doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
		doctype-public="-//W3C//DTD XHTML 1.1//EN" />


<xsl:template match="/">

  <xsl:variable name="link_prefix" select="/_R_/runtime/link_prefix"/>

  <xsl:variable name="path_prefix" select="/_R_/runtime/path_prefix"/>

  <xsl:variable name="my18n" select="document('../../i18n/en_US/phunkybb.xml')/i18n"/>

  <html>
    <xsl:call-template name="head">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
    </xsl:call-template>
    <body onload="sh_highlightDocument(); getDates();">

      <xsl:for-each select="/_R_/pre_body_content">
        <xsl:sort select="priority"/>
        <xsl:value-of select="string" disable-output-escaping="yes"/>
      </xsl:for-each>


      <xsl:call-template name="main">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>



      <xsl:for-each select="/_R_/footer">
        <xsl:sort select="priority"/>
        <xsl:value-of select="string" disable-output-escaping="yes"/>
      </xsl:for-each>

			<xsl:if test="//o_google_analytics_code">



			<script src="http://www.google-analytics.com/ga.js" type="text/javascript"></script>
			<script type="text/javascript">
			var pageTracker = _gat._getTracker("<xsl:value-of select="//o_google_analytics_code"/>");
			pageTracker._initData();
			pageTracker._trackPageview();
			</script>
			</xsl:if>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>
