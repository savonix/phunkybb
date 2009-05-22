<!--
Program: PhunkyBB
Component: main_menu.xsl
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
<xsl:template name="menu">
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

		<div id="main-menu" class="inbox">

      <xsl:call-template name="breadcrumbs">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
        <xsl:with-param name="forum_get_by_id" select="$forum_get_by_id"/>
        <xsl:with-param name="topic_get_by_id" select="$topic_get_by_id"/>
      </xsl:call-template>

			<span style="position:absolute;right:20px;">
      <xsl:value-of select="//o_extra_menu_items" disable-output-escaping="yes"/>
      <xsl:choose>
				<xsl:when test="/_R_/runtime/username">
					<xsl:if test="/_R_/runtime/group_id='1'">
						<a href="{$link_prefix}admin">
							<xsl:value-of select="$my18n/administration"/>
						</a>
            &#8226;
					</xsl:if>
					<a href="{$link_prefix}profile">
            <xsl:value-of select="$my18n/profile"/>
          </a>
					<xsl:if test="/_R_/runtime/last_visit_timestamp &lt; //last_post_timestamp">
            &#8226;
						<a href="{$link_prefix}user-read-all">Mark All Messages Read</a>
					</xsl:if>
          &#8226;
          <a href="{$link_prefix}logout"><xsl:value-of select="$my18n/logout"/></a>
				</xsl:when>
				<xsl:otherwise>
          <xsl:if test="contains(/_R_/runtime/user_agent,'gui_browser')">
          &#8226;
          <a rel="nofollow" href="{$link_prefix}register">
						<xsl:value-of select="$my18n/register"/>
					</a>
          &#8226;
          <a rel="nofollow" href="{$link_prefix}login">
						<xsl:value-of select="$my18n/login"/>
					</a>
          </xsl:if>
				</xsl:otherwise>
			</xsl:choose>
      </span>


		</div>

    <xsl:call-template name="source_spacer">
        <xsl:with-param name="section_end">main_menu</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

	<xsl:template name="breadcrumbs">
		<xsl:param name="link_prefix"/>
		<xsl:param name="path_prefix"/>
		<xsl:param name="my18n"/>
		<xsl:param name="forum_get_by_id"/>
		<xsl:param name="topic_get_by_id"/>
      <ul class="breadcrumbs" style="display:inline;">
        <li>
          <a href="{$link_prefix}index">
            <xsl:value-of select="$my18n/index"/>
          </a>
        </li>
        <!-- Forum Link -->
        <xsl:if test="$forum_get_by_id/forum_name">
        <li>
          &#187;
          <h1>
          <xsl:if test="//mod_rewrite='true' and not($forum_get_by_id/forum_basename='')">
            <a title="{$forum_get_by_id/forum_desc}">
              <xsl:attribute name="href">
                <xsl:value-of select="//path_prefix"/>
                <xsl:value-of select="$forum_get_by_id/forum_basename"/>
                <xsl:text>/</xsl:text>
              </xsl:attribute>
              <xsl:value-of select="$forum_get_by_id/forum_name"/>
            </a>
          </xsl:if>
          <xsl:if test="not(//mod_rewrite='true') or $forum_get_by_id/forum_basename=''">
            <a title="{$forum_get_by_id/forum_desc}"
              href="{$link_prefix}forum&amp;forum_basename={$forum_get_by_id/forum_basename}&amp;fid={$forum_get_by_id/id}">
              <xsl:value-of select="forum_name"/>
            </a>
          </xsl:if>
          </h1>
        </li>
          <xsl:if test="not($topic_get_by_id/subject) and /_R_/runtime/username">
          <li>
            &#187;
            <a href="{$path_prefix}post/">
              <xsl:value-of select="$my18n/post_topic"/>
            </a>
          </li>
          </xsl:if>
        </xsl:if>

        <!-- Topic Link -->
        <xsl:if test="$topic_get_by_id/subject">
          <li>
            &#187;
            <h2>
            <xsl:if test="//mod_rewrite='true' and not($forum_get_by_id/basename='')">
              <a title="{$topic_get_by_id/subject}" id="topic-{id}" href="{$path_prefix}{$topic_get_by_id/link}">
                <xsl:value-of select="$topic_get_by_id/subject"/>
              </a>
            </xsl:if>
            <xsl:if test="not(//mod_rewrite='true') or $forum_get_by_id/basename=''">
              <a href="{$link_prefix}topic&amp;basename={$topic_get_by_id/basename}&amp;fid={$forum_get_by_id/id}&amp;id={$topic_get_by_id/id}">
                <xsl:value-of select="$topic_get_by_id/subject"/>
              </a>
            </xsl:if>
            </h2>
          </li>
          <xsl:if test="/_R_/runtime/username">
          <li>
            &#187;
            <a href="#" onclick="show_quickpost();">
              Reply
            </a>
          </li>
          </xsl:if>
        </xsl:if>
      </ul>
	</xsl:template>
</xsl:stylesheet>
