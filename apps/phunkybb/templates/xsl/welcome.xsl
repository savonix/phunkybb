<!--
Program: PhunkyBB
Component: welcome.xsl
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
<xsl:include href="html_main.xsl"/>
<xsl:template name="content">
<xsl:param name="link_prefix"/>
    <xsl:for-each select="/_R_/categories_get_all/categories_get_all[cid=/_R_/forums_get_all/forums_get_all/cid]">
    <xsl:variable name="my_cid"><xsl:value-of select="cid"/></xsl:variable>
	<h2><xsl:value-of select="cat_name"/></h2>
	<div class="box">
		<div class="inbox">
			<table cellspacing="0">
			<thead>
				<tr>
					<th class="tcl" scope="col">
                        <xsl:value-of select="/_R_/i18n/forums"/>
                    </th>
					<th class="tc2" scope="col">
                        <xsl:value-of select="/_R_/i18n/topics"/>
                    </th>
					<th class="tc3" scope="col">
                        <xsl:value-of select="/_R_/i18n/posts"/>
                    </th>
					<th class="tcr" scope="col">
                        <xsl:value-of select="/_R_/i18n/last_post"/>
                    </th>
				</tr>
			</thead>
			<tbody>
            <xsl:for-each select="/_R_/forums_get_all/forums_get_all[cid=$my_cid]">
            <tr>
                <td class="tcl">
                    <div class="intd">
                            <xsl:if test="not(/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp)">
                            <div class="icon"><div class="nosize"></div></div>
                            </xsl:if>
                            <xsl:if test="/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp">
                            <div class="icon inew"><div class="nosize"></div></div>
                            </xsl:if>
                        <div class="tclcon">
                        <h3>
                            <a href="{$link_prefix}forum&amp;fid={fid}">
                                <xsl:value-of select="forum_name"/>
                            </a>
                        </h3>
                        </div>
                    </div>
                </td>
                <td class="tc2"><xsl:value-of select="num_topics"/></td>
                <td class="tc3"><xsl:value-of select="num_posts"/></td>
                <td class="tcr">
                    <xsl:if test="not(last_post='1969-12-31 20:00:00') and not(last_post='1970-01-01 00:00:00')">
                        <xsl:value-of select="last_post"/>
                        <xsl:if test="not(/_R_/runtime/user_id &gt; 0)">
                            UTC
                        </xsl:if>
                    </xsl:if>
                </td>
            </tr>
            </xsl:for-each>
            </tbody>
            </table>
        </div>
    </div>
    <br/>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
