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
<xsl:include href="main.xsl"/>
<xsl:template name="profile-menu">
	<div class="blockmenu">
    <h2><span><xsl:value-of select="//label[key='profile_menu']/value"/></span></h2>
	    <div class="box">
			<div class="inbox">
				<ul>
					<li><a href="{//link_prefix}profile&amp;id=">Essentials</a></li>
					<li><a href="{//link_prefix}personality&amp;id=">Personality</a></li>
					<li><a href="{//link_prefix}display&amp;id=">Display</a></li>
					<li><a href="{//link_prefix}privacy&amp;id=">Privacy</a></li>
                    <xsl:if test="//runtime/group_id=1">
					<li><a href="{//link_prefix}user-admin&amp;id=">Administration</a></li>
                    </xsl:if>
                </ul>
			</div>
		</div>
	</div>
</xsl:template>
</xsl:stylesheet>