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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>

		<xsl:variable
      name   = "forum_get_by_id"
			select = "/_R_/forum_get_by_id/forum_get_by_id"
    />

		<div class="blocktable">
        <table cellspacing="0" >
          <thead>
            <tr>
              <th class="tcl" scope="col">
                <span style="float:right;">
                  <xsl:if test="contains(//user_agent,'gui_browser')">
                  <xsl:if test="/_R_/runtime/username">
                  <a href="{$link_prefix}post&amp;fid={$forum_get_by_id/id}">
                    <xsl:value-of select="$my18n/post_topic"/>
                  </a>&#160;
                  </xsl:if>
                  <a href="{$link_prefix}x-forum-rss&amp;fid={$forum_get_by_id/id}">
                    <img style="margin:-3px 0;" src="{$path_prefix}s/img/icons/famfamfam/rss.png" alt="RSS"/>
                  </a>
                  </xsl:if>
                </span>
                <b><xsl:value-of select="$forum_get_by_id/forum_name"/></b>
              </th>
            </tr>
          </thead>
        </table>
    </div>
		<div class="tableframe">
      <table>
          <thead>
            <tr>
              <th class="tcl" scope="col">
                <xsl:value-of select="$my18n/topics"/>
              </th>
              <th class="tc2" scope="col">
                <xsl:value-of select="$my18n/replies"/>
              </th>
              <th class="tc2" scope="col">
                <xsl:value-of select="$my18n/views"/>
              </th>
              <th class="tcr">
                <xsl:value-of select="$my18n/last_post"/>
              </th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="/_R_/topics_get_by_forum_id/topics_get_by_forum_id">
              <tr>
                <td class="tcl">
                  <xsl:if test="//runtime/group_id=1">
                    <a style="float: right;" href="#x-topic-delete&amp;topic_id={id}"
                      onclick="topic_delete({id}); return false;">
                      x
                    </a>
                  </xsl:if>
                  <xsl:if test="not(/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp)">
                    <div class="icon"/>
                  </xsl:if>
                  <xsl:if test="/_R_/runtime/last_visit_timestamp &lt; last_post_timestamp">
                    <div class="icon inew"/>
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
                <td class="tc2">
                  <xsl:value-of select="num_views"/>
                </td>
                <td class="tcr">
                  <span class="reldate">
                    <xsl:if test="not(last_post='1969-12-31 20:00:00')">
                      <xsl:value-of select="last_post"/>
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
                <td class="tcl" colspan="4">
                  <xsl:value-of select="$my18n/forum_is_empty"/>.
                </td>
              </tr>
            </xsl:if>
          </tbody>
        </table>
    </div>
	</xsl:template>

	<xsl:template name="post_new_topic">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>
		<xsl:param name="forum_get_by_id"/>
			<xsl:if test="/_R_/runtime/username">
			<div class="button-basic-blue" style="float: right;"
				onclick="location.href='{$link_prefix}post&amp;fid={$forum_get_by_id/id}';">
					<a style="color: blue" href="{$link_prefix}post&amp;fid={$forum_get_by_id/id}">
						<img src="{$path_prefix}s/img/icons/famfamfam/add.png"/>
						<xsl:value-of select="$my18n/post_topic"/>
					</a>
			</div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
