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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="header">
    <xsl:param name="link_prefix"/>
    
    <xsl:param name="path_prefix"/>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">header</xsl:with-param>
    </xsl:call-template>

    <div id="header">
      <div id="brdheader" class="block">
        <div class="box">
          <div id="brdtitle" class="inbox">
            <h1>
              <a href="{$link_prefix}index">
                <xsl:value-of select="//o_board_title"/>
              </a>
            </h1>
            <p>
              <span>
                <xsl:value-of select="/_R_/board_config/o_board_desc"/>
              </span>
            </p>
          </div>
          <xsl:call-template name="menu">
            <xsl:with-param name="link_prefix">
              <xsl:value-of select="$link_prefix"/>
            </xsl:with-param>
          </xsl:call-template>
          <div id="brdwelcome" class="inbox">
            <xsl:if test="not(/_R_/runtime/username)">
              <p>You are not logged in.</p>
            </xsl:if>
            <xsl:if test="/_R_/runtime/username">
              Logged in as <b><xsl:value-of select="/_R_/runtime/username"/></b>
            </xsl:if>
          </div>
        </div>
      </div>
    </div>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">header</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
