<!--
Program: PhunkyBB
Component: topic_edit.xsl
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
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="prev_next.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>

		<xsl:variable
      name   = "topic_get_by_id"
			select = "/_R_/topic_get_by_id/topic_get_by_id"
    />

		<form method="post">
			<input type="hidden" name="topic_id" value="{$topic_get_by_id/id}"/>
			Move topic to:
			<br/>
			<br/>
			<select name="forum_id">
				<xsl:for-each select="/_R_/forums_get_all/forums_get_all">
					<option value="{fid}">
						<xsl:value-of select="forum_name"/>
					</option>
				</xsl:for-each>
			</select>
			<input type="submit"/>
		</form>
	</xsl:template>
</xsl:stylesheet>
