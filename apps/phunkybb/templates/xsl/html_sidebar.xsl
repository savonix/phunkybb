<!--
Program: PhunkyBB
Component: main_sidebar.xsl
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
<xsl:template name="sidebar">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>
    <xsl:param name="my18n"/>
		<xsl:variable
      name   = "forum_get_by_id"
			select = "/_R_/forum_get_by_id/forum_get_by_id"
    />

		<xsl:variable
      name   = "topic_get_by_id"
			select = "/_R_/topic_get_by_id/topic_get_by_id"
    />

    <xsl:call-template name="source_spacer">
        <xsl:with-param name="section_start">main_menu</xsl:with-param>
    </xsl:call-template>

		<div id="sidebar">
    </div>
	</xsl:template>
</xsl:stylesheet>
