<!--
Program: PhunkyBB
Component: html_standard.xsl
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
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
	>
	<xsl:output
    method               = "xml"
		indent               = "yes"
    encoding             = "UTF-8"
    omit-xml-declaration = "yes"
		doctype-system       = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public       = "-//W3C//DTD XHTML 1.0 Transitional//EN"
  />
  <xsl:strip-space elements="*"/>


<xsl:template match="/">
  <xsl:variable name="link_prefix" select="/_R_/runtime/link_prefix"/>

  <xsl:variable name="path_prefix" select="/_R_/runtime/path_prefix"/>

  <xsl:variable name="my18n" select="document('../../i18n/en_US/phunkybb.xml')/i18n"/>

  <html>
    <xsl:call-template name="head">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
    </xsl:call-template>
    <body>

      <xsl:for-each select="//pre_body_content">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>

      <xsl:call-template name="main">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>

      <xsl:for-each select="//post_body_content">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
<!--
          <xsl:if test="not(/_R_/runtime/output='xhtml')">
          <div id="header-banner">
            <script type="text/javascript">
            <xsl:comment>
            google_ad_client = "pub-9657495873329253";
            //468x60, created 12/4/07
            google_ad_slot = "3998548064";
            google_ad_width = 468;
            google_ad_height = 60;
            //</xsl:comment>
            </script>
            <script type="text/javascript"
              src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
            </script>
          </div>
          </xsl:if>
-->
		</body>
  </html>
</xsl:template>
<xsl:template match="node()">
<xsl:element name="{name()}">
<xsl:apply-templates select="@*|node()"/>
</xsl:element>
</xsl:template>

<xsl:template match="@*|text()|comment()|processing-instruction()">
<xsl:copy/>
</xsl:template>

</xsl:stylesheet>
