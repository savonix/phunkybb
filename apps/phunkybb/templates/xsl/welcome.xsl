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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:include href="html_main.xsl"/>
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="my18n"/>
		<div class="blocktable">
      <table cellspacing="0">
        <tr>
          <th class="tcl">
          <strong><xsl:value-of select="/_R_/site_config/o_board_title"/></strong>
          </th>
        </tr>
      </table>
    </div>
    <div class="tableframe">
    <xsl:for-each select="/_R_/categories_get_all/categories_get_all[cid=/_R_/forums_get_all/forums_get_all/cid]">
      <xsl:variable name="my_cid" select="cid"/>
        <xsl:call-template name="jquery-setup-simple">
          <xsl:with-param name="link_prefix" select="$link_prefix"/>
          <xsl:with-param name="path_prefix" select="$path_prefix"/>
          <xsl:with-param name="my18n" select="$my18n"/>
          <xsl:with-param name="my-table">forums_table<xsl:value-of select="$my_cid"/></xsl:with-param>
          <xsl:with-param name="no-sort-column">,
            headers: {
              1: {sorter: false},
              2: {sorter: false}
            }
          </xsl:with-param>
        </xsl:call-template>
        <table cellspacing="0" class="tablesorter" id="forums_table{$my_cid}">
					<thead>
						<tr>
							<th>
                <xsl:value-of select="cat_name"/>&#160;
                <xsl:value-of select="$my18n/forums"/>
							</th>
							<th>
								<xsl:value-of select="$my18n/topics"/>
							</th>
							<th>
								<xsl:value-of select="$my18n/posts"/>
							</th>
							<th>
								<xsl:value-of select="$my18n/last_post"/>
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="/_R_/forums_get_all/forums_get_all[cid=$my_cid]">
							<tr>
								<td class="col-left">
									<div class="intd">
										<xsl:if test="not(/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp)">
											<div class="icon">
											</div>
										</xsl:if>
										<xsl:if test="/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp">
											<div class="icon inew">
											</div>
										</xsl:if>
										<div class="tclcon">
											<h3>
											<xsl:if test="//mod_rewrite='true' and not(forum_basename='')">
												<a title="{forum_desc}">
													<xsl:attribute name="href">
														<xsl:value-of select="//path_prefix"/>
														<xsl:value-of select="forum_basename"/>
														<xsl:text>/</xsl:text>
													</xsl:attribute>
													<xsl:value-of select="forum_name"/>
												</a>
											</xsl:if>
											<xsl:if test="not(//mod_rewrite='true') or forum_basename=''">
												<a title="{forum_desc}"
													href="{$link_prefix}forum&amp;forum_basename={forum_basename}&amp;fid={fid}">
													<xsl:value-of select="forum_name"/>
												</a>
                      </xsl:if>
											</h3>
										</div>
									</div>
								</td>
								<td>
									<xsl:value-of select="num_topics"/>
								</td>
								<td>
									<xsl:value-of select="num_posts"/>
								</td>
								<td>
									<span class="reldate">
										<xsl:if test="not(last_post='1969-12-31 20:00:00') and not(last_post='1970-01-01 00:00:00')">
											<xsl:value-of select="last_post"/>
										</xsl:if>
									</span>
									by <xsl:value-of select="last_poster"/>
								</td>
							</tr>
						</xsl:for-each>
            </tbody>
          </table>
      <br/>
    </xsl:for-each>
    </div>
  <xsl:call-template name="pager">
    <xsl:with-param name="my-table">forums_table</xsl:with-param>
  </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
