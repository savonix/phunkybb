<!--
Program: PhunkyBB
Component: forum.xsl
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

<xsl:template name="content">
<div class="linkst">
	<div class="inbox">
		<p class="pagelink conl">Pages: <strong>1</strong></p>
		<p class="postlink conr"><a href="{//link_prefix}post&amp;fid={//_get/fid}">Post new topic</a></p>

		<ul><li><a href="{//link_prefix}index">Index</a>&#160;</li><li> - &#160;<xsl:value-of select="//forum_get_by_id/forum_name"/></li></ul>
		<div class="clearer"></div>
	</div>
</div>
<div id="vf" class="blocktable">
	<h2><span><xsl:value-of select="//forum_get_by_id/forum_name"/></span></h2>
	<div class="box">
		<div class="inbox">
			<table cellspacing="0">
			<thead>
				<tr>
					<th class="tcl" scope="col"><xsl:value-of select="//label[key='topic']/value"/></th>
					<th class="tc2" scope="col"><xsl:value-of select="//label[key='replies']/value"/></th>
					<th class="tc3" scope="col"><xsl:value-of select="//label[key='views']/value"/></th>
					<th class="tcr" scope="col"><xsl:value-of select="//label[key='last_post']/value"/></th>
				</tr>
			</thead>
			<tbody>
                <xsl:for-each select="//topics_get_by_forum_id">
				<tr>
					<td class="tcl">
						<div class="intd">
							<div class="icon"><div class="nosize"></div></div>
							<div class="tclcon">
								<a href="{//link_prefix}topic&amp;fid={//_get/fid}&amp;id={id}"><xsl:value-of select="subject"/></a>
							</div>
						</div>
					</td>
					<td class="tc2"><xsl:value-of select="num_replies"/></td>
					<td class="tc3"><xsl:value-of select="num_views"/></td>
					<td class="tcr"><xsl:value-of select="last_post"/></td>
				</tr>
                </xsl:for-each>
                <xsl:if test="not(//topics_get_by_forum_id)">
				<tr>
					<td class="tcl" colspan="4">Forum is empty.</td>
				</tr>
                </xsl:if>
            </tbody>
            </table>
        </div>
    </div>
</div>
<div class="linkst">
	<div class="inbox">
		<p class="pagelink conl">Pages: <strong>1</strong></p>
		<p class="postlink conr"><a href="{//link_prefix}post&amp;fid={//_get/fid}">Post new topic</a></p>

		<ul><li><a href="{//link_prefix}index">Index</a>&#160;</li><li> - &#160;<xsl:value-of select="//forum_get_by_id/forum_name"/></li></ul>
		<div class="clearer"></div>
	</div>
</div>
</xsl:template>
</xsl:stylesheet>
