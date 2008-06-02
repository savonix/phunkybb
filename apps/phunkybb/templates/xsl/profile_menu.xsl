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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:template name="profile-menu">
<xsl:param name="link_prefix"/>

	<div class="blockmenu">
    <h2><span><xsl:value-of select="/_R_/i18n/profile_menu"/></span></h2>
	    <div class="box">
			<div class="inbox">
				<ul>
                    <xsl:if test="/_R_/_get/user_id and //runtime/group_id=1">
					<li><a href="{$link_prefix}profile&amp;user_id={/_R_/_get/user_id}">Essentials</a></li>
					<li><a href="{$link_prefix}personality&amp;user_id={/_R_/_get/user_id}">Personality</a></li>
					<!--<li><a href="{$link_prefix}display&amp;user_id={/_R_/_get/user_id}">Display</a></li>
					<li><a href="{$link_prefix}privacy&amp;user_id={/_R_/_get/user_id}">Privacy</a></li>-->
					<li><a href="{$link_prefix}user-admin&amp;user_id={/_R_/_get/user_id}">Administration</a></li>
                    </xsl:if>
                    <xsl:if test="not(/_R_/_get/user_id)">
					<li><a href="{$link_prefix}profile">Essentials</a></li>
					<li><a href="{$link_prefix}personality">Personality</a></li>
					<!--<li><a href="{$link_prefix}display">Display</a></li>
					<li><a href="{$link_prefix}privacy">Privacy</a></li>-->
                    <xsl:if test="//runtime/group_id=1">
					<li><a href="{$link_prefix}user-admin">Administration</a></li>
                    </xsl:if>
                    </xsl:if>
                </ul>
			</div>
		</div>
	</div>
</xsl:template>
</xsl:stylesheet>
