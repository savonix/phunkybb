<!--
Program: PhunkyBB
Component: profile_menu.xsl
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
	<xsl:template name="profile-menu">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>
		<xsl:variable name="my_user_id" select="/_R_/_get/user_id"/>
		<div class="blockmenu">
			<h2>
				<span>
					<xsl:value-of select="$my18n/profile_menu"/>
				</span>
			</h2>
			<div class="box">
				<div class="inbox">
					<ul>
						<xsl:choose>
							<xsl:when test="$my_user_id and /_R_/runtime/group_id=1">
								<li>
									<a href="{$link_prefix}profile&amp;user_id={$my_user_id}">
                    <xsl:value-of select="$my18n/essentials"/>
                  </a>
								</li>
								<li>
									<a href="{$link_prefix}pictures">
                  <xsl:value-of select="$my18n/picture"/>
                </a>
								</li>
								<li>
									<a href="{$link_prefix}personality&amp;user_id={$my_user_id}">
                    <xsl:value-of select="$my18n/personality"/>
                  </a>
								</li>
								<li>
									<a href="{$link_prefix}admin-user-admin&amp;user_id={$my_user_id}">
                    <xsl:value-of select="$my18n/administration"/>
                  </a>
								</li>
							</xsl:when>
							<xsl:otherwise>
								<li>
									<a href="{$link_prefix}profile">
                    <xsl:value-of select="$my18n/essentials"/>
                  </a>
								</li>
								<li>
									<a href="{$link_prefix}pictures">
                    <xsl:value-of select="$my18n/picture"/>
                  </a>
								</li>
								<li>
									<a href="{$link_prefix}personality">
                    <xsl:value-of select="$my18n/personality"/>
                  </a>
								</li>
								<xsl:if test="/_R_/runtime/group_id=1">
									<li>
										<a href="{$link_prefix}admin-user-admin">
                      <xsl:value-of select="$my18n/administration"/>
                    </a>
									</li>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</ul>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
