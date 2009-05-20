<!--
Program: PhunkyBB
Component: html_header.xsl
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
  <xsl:template name="header">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="my18n"/>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">header</xsl:with-param>
    </xsl:call-template>

		<div class="block">

      <xsl:call-template name="menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>

			<div class="box" style="border:0;">
				<div id="brdtitle" class="inbox">
          <xsl:if test="contains(//user_agent,'gui_browser')">
            <a href="{$link_prefix}x-posts-rss">
              <img src="{//path_prefix}/s/img/icons/famfamfam/feed.png"
                class="rssicon" alt="RSS"/>
            </a>
          </xsl:if>
          <xsl:if test="/_R_/_get/nid='index'">
					<h1 id="header-name">
						<a href="{$link_prefix}index">
              <span id="header-name-text">
							<xsl:value-of select="/_R_/site_config/o_board_title"/>
              </span>
						</a>
					</h1>
					<h2 id="header-description">
						<xsl:value-of select="/_R_/site_config/o_board_desc"/>
					</h2>
          </xsl:if>
          <xsl:if test="not(/_R_/_get/nid='index')">
					<div id="header-name">
						<a href="{$link_prefix}index">
              <span id="header-name-text">
							<xsl:value-of select="/_R_/site_config/o_board_title"/>
              </span>
						</a>
					</div>
					<div id="header-description">
						<xsl:value-of select="/_R_/site_config/o_board_desc"/>
					</div>
          </xsl:if>
				</div>
			</div>

		</div>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">header</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
