<!--
Program: PhunkyBB
Component: prev_next.xsl
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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="previous_next">
		<xsl:param name="qsa"/>
		<xsl:param name="max"/>
		<xsl:param name="link_prefix"/>
		<xsl:if test="
			(/_R_/_get/start!=0) and
			not(/_R_/_get/start='NaN') and
			((/_R_/_get/start + //incr) &lt; $max)
			">
			<a href="{$link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={/_R_/_get/start - //incr}">Previous</a>
			&#160;
			<a href="{$link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={/_R_/_get/start + //incr}">Next</a>
		</xsl:if>

		<xsl:if test="
			(/_R_/_get/start!=0) and
			not(/_R_/_get/start='NaN') and
			((/_R_/_get/start + //incr) &gt; $max)
			">
			<a href="{$link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={/_R_/_get/start - //incr}">Previous</a>
			&#160;
			Next
		</xsl:if>

		<xsl:if test="(/_R_/_get/start=0) or not(/_R_/_get/start)">
			Previous
			&#160;
			<a href="{$link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={//incr}">Next</a>
		</xsl:if>
	</xsl:template>

	<xsl:template name="pages">
		<xsl:param name="qsa"/>
		<xsl:param name="max"/>
		<xsl:param name="link_prefix"/>
		<xsl:param name="number_of_pages"/>
		<xsl:param name="page_number">1</xsl:param>
		<xsl:if test="not((//incr * ($page_number - 1))=//_get/start)">
		<a href="{$link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={//incr * ($page_number - 1)}">
			<xsl:value-of select="$page_number"/>
		</a>&#160;
		</xsl:if>
		<xsl:if test="(//incr * ($page_number - 1))=//_get/start">
		<b>
			<xsl:value-of select="$page_number"/>
		</b>&#160;
		</xsl:if>
		<xsl:if test="$number_of_pages">
			<xsl:call-template name="pages">
				<xsl:with-param name="qsa" select="$qsa"/>
				<xsl:with-param name="max"/>
				<xsl:with-param name="link_prefix" select="$link_prefix"/>
				<xsl:with-param name="number_of_pages" select="$number_of_pages - 1"/>
				<xsl:with-param name="page_number" select="$page_number + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
