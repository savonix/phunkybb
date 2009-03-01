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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="html_main.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>

		<xsl:variable name="forum_get_by_id"
			select="/_R_/forum_get_by_id/forum_get_by_id"/>
		<div class="linkst">
			<a href="{$link_prefix}x-forum-rss&amp;fid={$forum_get_by_id/id}">
				<img src="{//path_prefix}/s/img/icons/famfamfam/feed.png"
					style="float:right;padding-left:7px;margin-top:3px;" alt="RSS"/>
			</a>
			<!--
			<p class="pagelink conl">
				<xsl:value-of select="$my18n/pages"/>:
				<strong>
					<xsl:value-of select="/_R_/forum_get_number_of_pages/forum_get_number_of_pages/pages"/>
				</strong>
			</p>
			-->
				<xsl:call-template name="post_new_topic">
					<xsl:with-param name="link_prefix" select="$link_prefix"/>
					<xsl:with-param name="path_prefix" select="$path_prefix"/>
					<xsl:with-param name="my18n" select="$my18n"/>
				</xsl:call-template>
				<ul class="breadcrumbs">
					<li>
						<a href="{$link_prefix}index">
							<xsl:value-of select="$my18n/index"/>
						</a>&#160;
					</li>
					<li>
						&gt; &#160;
						<a href="{$link_prefix}forum&amp;fid={$forum_get_by_id/id}">
							<xsl:value-of select="$forum_get_by_id/forum_name"/>
						</a>
					</li>
				</ul>
		</div>
		<div id="vf" class="blocktable">
			<h2>
				<xsl:value-of select="$forum_get_by_id/forum_name"/>
			</h2>
			<div class="box">
				<div class="inbox">
					<table cellspacing="0">
						<thead>
							<tr>
								<th class="tcl" scope="col">
									<xsl:value-of select="$my18n/topic"/>
								</th>
								<th class="tc2" scope="col">
									<xsl:value-of select="$my18n/replies"/>
								</th>
								<th class="tcr" scope="col">
									<xsl:value-of select="$my18n/last_post"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="/_R_/topics_get_by_forum_id/topics_get_by_forum_id">
								<tr>
									<td class="tcl">
											<xsl:if test="not(/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp)">
												<div class="icon">
													<div class="nosize"></div>
												</div>
											</xsl:if>
											<xsl:if test="/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp">
												<div class="icon inew">
													<div class="nosize"></div>
												</div>
											</xsl:if>
											<!-- Need to use the link_builder here! -->
												<xsl:if test="//mod_rewrite='true' and not(basename='')">
													<a title="{subject}" id="topic-{id}" href="{$path_prefix}{link}">
													<!--
														<xsl:attribute name="href">
															<xsl:value-of select="$path_prefix"/>
															<xsl:value-of select="$forum_get_by_id/forum_basename"/>
															<xsl:text>/</xsl:text>
															<xsl:value-of select="basename"/>
															<xsl:text>/</xsl:text>
														</xsl:attribute>
														-->
														<xsl:value-of select="subject"/>
													</a>
												</xsl:if>
												<xsl:if test="not(//mod_rewrite='true') or basename=''">
													<a href="{$link_prefix}topic&amp;basename={basename}&amp;fid={$forum_get_by_id/id}&amp;id={id}">
														<xsl:value-of select="subject"/>
													</a>
												</xsl:if>
									</td>
									<td class="tc2">
										<xsl:value-of select="num_replies"/>
									</td>
									<td>
										<span class="date">
											<xsl:if test="not(last_post='1969-12-31 20:00:00')">
												<xsl:value-of select="last_post"/>
											</xsl:if>
											<xsl:if test="not(/_R_/runtime/user_id &gt; 0)">
												UTC
											</xsl:if>
										</span>
										<xsl:if test="not(last_poster=0)">
											by <xsl:value-of select="last_poster"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="not(/_R_/topics_get_by_forum_id)">
								<tr>
									<td class="tcl" colspan="3">
										<xsl:value-of select="$my18n/forum_is_empty"/>.
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="linkst">
			<!--
			<p class="pagelink conl">
				<xsl:value-of select="$my18n/pages"/>:
				<strong></strong>
			</p>
			-->

			<a href="{$link_prefix}x-forum-rss&amp;fid={$forum_get_by_id/id}">
				<img src="{//path_prefix}/s/img/icons/famfamfam/feed.png"
					style="float:right;padding-left:7px;margin-top:3px;" alt="RSS"/>
			</a>
				<xsl:call-template name="post_new_topic">
					<xsl:with-param name="link_prefix" select="$link_prefix"/>
					<xsl:with-param name="path_prefix" select="$path_prefix"/>
					<xsl:with-param name="my18n" select="$my18n"/>
				</xsl:call-template>
				<ul class="breadcrumbs">
					<li>
						<a href="{$link_prefix}index">
							<xsl:value-of select="$my18n/index"/>
						</a>&#160;
					</li>
					<li>
						&gt; &#160;
						<a href="{$link_prefix}forum&amp;fid={$forum_get_by_id/id}">
							<xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
						</a>
					</li>
				</ul>
		</div>
	</xsl:template>

	<xsl:template name="post_new_topic">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>
			<xsl:if test="/_R_/runtime/username">
			<div class="button-basic-blue" style="float: right;"
				onclick="location.href='{$link_prefix}post&amp;fid={/_R_/forum_get_by_id/forum_get_by_id/id}';">
					<a href="{$link_prefix}post&amp;fid={/_R_/forum_get_by_id/forum_get_by_id/id}">
						<img src="{$path_prefix}s/img/icons/famfamfam/add.png"/>
						<xsl:value-of select="$my18n/post_topic"/>
					</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
