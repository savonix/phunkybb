<!--
Program: PhunkyBB - http://www.phunkybb.com
Component: 	sitemap.xml.xsl
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
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" />
  <xsl:template match="/">
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

      <xsl:variable name="base_url">
        <xsl:if test="contains(//o_base_url,'index.php')">
          <xsl:value-of select="substring-before(//o_base_url,'index.php')" />
        </xsl:if>
        <xsl:if test="not(contains(//o_base_url,'index.php'))">
          <xsl:value-of select="//o_base_url" />
        </xsl:if>
      </xsl:variable>
      <url>
        <loc>
          <xsl:value-of select="$base_url"/>
        </loc>
        <priority>0.8</priority>
        <changefreq>daily</changefreq>
      </url>
      <!-- Forums -->
      <xsl:for-each select="/_R_/forums_get_all/forums_get_all">
        <url>
          <loc>
            <xsl:value-of select="$base_url"/>
            <xsl:value-of select="forum_basename"/>
            <xsl:text>/</xsl:text>
          </loc>
          <lastmod>
            <xsl:value-of select="last_post"/>
          </lastmod>
          <changefreq>weekly</changefreq>
        </url>
      </xsl:for-each>
      <!-- Topics -->
      <xsl:for-each select="/_R_/topics_get_all/topics_get_all">
        <url>
          <loc>
            <xsl:value-of select="$base_url"/>
            <xsl:value-of select="forum_basename"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="basename"/>
            <xsl:text>/</xsl:text>
          </loc>
          <lastmod>
            <xsl:value-of select="last_post"/>
          </lastmod>
          <changefreq>daily</changefreq>
        </url>
      </xsl:for-each>

    </urlset>
  </xsl:template>
</xsl:stylesheet>
