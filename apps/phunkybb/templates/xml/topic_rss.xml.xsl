<!--
Program: PhunkyBB - http://www.phunkybb.com
Component: topic_rss.xml.xsl
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
		<rss version="2.0">
			<channel>
				<title></title>
				<link></link>
				<description>
				</description>
				<language>en-us</language>
				<lastBuildDate></lastBuildDate>
				<docs>http://backend.userland.com/rss2</docs>
				<generator></generator>
				<category>Topics</category>
				<xsl:for-each select="//topics_get_all">
					<item>
						<title></title>
						<link></link>
						<description>
						 </description>
						<pubDate></pubDate>
						<author></author>
					</item>
				</xsl:for-each>
			</channel>
		</rss>
	</xsl:template>
</xsl:stylesheet>
