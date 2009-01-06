<!--
Program: PhunkyBB
Component: main_menu.xsl
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
<xsl:template name="menu">
  <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>

  <!-- i18n prefix -->

    <xsl:call-template name="source_spacer">
        <xsl:with-param name="section_start">main_menu</xsl:with-param>
    </xsl:call-template>

		<div id="brdmenu" class="inbox">
			<div style="float:right">
				<xsl:if test="not(/_R_/runtime/username)">
					You are not logged in.
				</xsl:if>
				<xsl:if test="/_R_/runtime/username">
					Logged in as <b><xsl:value-of select="/_R_/runtime/username"/></b>
				</xsl:if>
			</div>

			<xsl:copy-of select="//extra_menu_items" disable-output-escaping="no"/>
			<xsl:value-of select="//o_extra_menu_items" disable-output-escaping="yes"/>
			<a href="{$link_prefix}index">
					<xsl:value-of select="$my18n/index"/>
			</a>

			<xsl:choose>
				<xsl:when test="/_R_/runtime/username">
					<xsl:if test="/_R_/runtime/group_id='1'">
						<a href="{$link_prefix}admin">
							<xsl:value-of select="$my18n/administration"/>
						</a>
					</xsl:if>
					<a href="{$link_prefix}profile">Profile</a>
					<xsl:if test="/_R_/runtime/last_visit_timestamp &lt; //last_post_timestamp">
						<a href="{$link_prefix}user-read-all">Mark All Messages Read</a>
					</xsl:if>
					<a href="{$link_prefix}logout"><xsl:value-of select="$my18n/logout"/></a>
				</xsl:when>
				<xsl:otherwise>
					<a href="{$link_prefix}register">
						<xsl:value-of select="$my18n/register"/>
					</a>
					<a href="{$link_prefix}login">
						<xsl:value-of select="$my18n/login"/>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>

    <xsl:call-template name="source_spacer">
        <xsl:with-param name="section_end">main_menu</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
