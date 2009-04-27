<!--
Program: PhunkyBB
Component: html_main.xsl
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
  <xsl:include href="html_shell.xsl"/>
  <xsl:include href="html_menu.xsl"/>
  <xsl:include href="html_head.xsl"/>
  <xsl:include href="html_header.xsl"/>
  <xsl:include href="source_spacer.xsl"/>
  <xsl:include href="link_builder.xsl"/>

  <xsl:template name="main">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="my18n"/>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">main</xsl:with-param>
    </xsl:call-template>



    <div id="main">
      <div id="punwrap">
        <div class="pun">
          <xsl:call-template name="header">
            <xsl:with-param name="link_prefix" select="$link_prefix"/>
            <xsl:with-param name="path_prefix" select="$path_prefix"/>
            <xsl:with-param name="my18n" select="$my18n"/>
          </xsl:call-template>

          <xsl:call-template name="source_spacer">
            <xsl:with-param name="section_start">content</xsl:with-param>
          </xsl:call-template>
          <div id="content" class="blocktable">
            <xsl:call-template name="content">
              <xsl:with-param name="link_prefix" select="$link_prefix"/>
              <xsl:with-param name="path_prefix" select="$path_prefix"/>
              <xsl:with-param name="my18n" select="$my18n"/>
            </xsl:call-template>
          </div>
          <xsl:call-template name="source_spacer">
            <xsl:with-param name="section_end">content</xsl:with-param>
          </xsl:call-template>



          <xsl:call-template name="footer"/>
        </div>
      </div>
    </div>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">main</xsl:with-param>
    </xsl:call-template>
  </xsl:template>



	<xsl:template name="footer">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>

		<xsl:call-template name="source_spacer">
			<xsl:with-param name="section_start">footer</xsl:with-param>
		</xsl:call-template>

      <!-- Standard div to be replaced by a DOM object -->
			<xsl:if test="contains(/_R_/runtime/user_agent,'gui_browser')">
			<div id="nofooter"/>
      </xsl:if>

      <!-- Raw HTML for bots -->
			<xsl:if test="not(contains(/_R_/runtime/user_agent,'gui_browser'))">
				<p style="text-align: right;">
					Powered by&#160;<a href="http://www.phunkybb.com/blog/" title="Open Source Forums XSL Software">PhunkyBB</a>
          &#160;and&#160;<a href="http://www.nexista.com/blog/" title="Web Application Framework Software">Nexista</a>.
				</p>
      </xsl:if>

		<xsl:call-template name="source_spacer">
			<xsl:with-param name="section_end">footer</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
