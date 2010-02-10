<!--
Program: PhunkyBB
Component: html_custom.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

<xsl:template name="main">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>
  <xsl:param name="my18n"/>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">main</xsl:with-param>
  </xsl:call-template>



  <div id="main">
    <xsl:call-template name="header">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
      <xsl:with-param name="my18n" select="$my18n"/>
    </xsl:call-template>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">content</xsl:with-param>
    </xsl:call-template>
    <div id="content" class="blocktable">
      <xsl:call-template name="content">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>
    </div>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">content</xsl:with-param>
    </xsl:call-template>

    <xsl:call-template name="footer"/>
  </div>
  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">main</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="source_spacer">
  <xsl:param name="section_start"></xsl:param>
  <xsl:param name="section_end"></xsl:param>
  <!--
  <xsl:text>
</xsl:text>
  <xsl:if test="not($section_end='')">
    <xsl:comment>
      <xsl:value-of select="$section_end"/> end</xsl:comment>
  </xsl:if>
  <xsl:text>

</xsl:text>
  <xsl:if test="not($section_start='')">
    <xsl:comment>
      <xsl:value-of select="$section_start"/> start</xsl:comment>
  </xsl:if>
  <xsl:text>
</xsl:text>
-->
</xsl:template>
<xsl:template name="header">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>
  <xsl:param name="my18n"/>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">header</xsl:with-param>
  </xsl:call-template>

  <div id="header">

    <xsl:call-template name="menu">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="my18n" select="$my18n"/>
    </xsl:call-template>

    <div id="header-content">
      <xsl:if test="contains(//user_agent,'gui_browser')">
        <span style="float:right;padding-left:6px;margin-top:-1px;">
        <a href="{$link_prefix}x-posts-rss">
          <img src="{//path_prefix}/s/img/icons/famfamfam/feed.png"
            class="rssicon" alt="RSS"/>
        </a>
        </span>
      </xsl:if>
      <div id="header-inner">
        <xsl:if test="/_R_/_get/nid='index'">
        <h1 id="header-name">
          <a href="{$link_prefix}index">
            <span id="header-name-text">
            <xsl:value-of select="/_R_/site_config/o_board_title"/>
            </span>
          </a>
        </h1>
        <h2 id="header-description">
          <xsl:value-of select="/_R_/site_config/o_board_desc"/>
        </h2>
        </xsl:if>
        <xsl:if test="not(/_R_/_get/nid='index')">
        <div id="header-name">
          <a href="{$link_prefix}index">
            <span id="header-name-text">
            <xsl:value-of select="/_R_/site_config/o_board_title"/>
            </span>
          </a>
        </div>
        <div id="header-description">
          <xsl:value-of select="/_R_/site_config/o_board_desc"/>
        </div>
        </xsl:if>
      </div>
    </div>

  </div>
  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">header</xsl:with-param>
  </xsl:call-template>
</xsl:template>


<xsl:template name="menu">
<xsl:param name="link_prefix"/>
<xsl:param name="path_prefix"/>
  <xsl:param name="my18n"/>
  <xsl:variable name="forum_get_by_id"
  select="/_R_/forum_get_by_id/forum_get_by_id" />

  <xsl:variable name="topic_get_by_id"
  select="/_R_/topic_get_by_id/topic_get_by_id" />

  <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">main_menu</xsl:with-param>
  </xsl:call-template>

  <div id="main-menu">

    <xsl:call-template name="breadcrumbs">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
      <xsl:with-param name="my18n" select="$my18n"/>
      <xsl:with-param name="forum_get_by_id" select="$forum_get_by_id"/>
      <xsl:with-param name="topic_get_by_id" select="$topic_get_by_id"/>
    </xsl:call-template>

    <span style="text-align:right;display:block;width:100%;">
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
    <ul class="breadcrumbs">
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
<xsl:template name="head_bk">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">head</xsl:with-param>
  </xsl:call-template>

  <head>
    <xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
        <meta name="description" content="{/_R_/forum_get_by_id/forum_get_by_id/forum_name}: {/_R_/topic_get_by_id/topic_get_by_id/subject}"/>
    </xsl:if>
    <xsl:if test="not(/_R_/forum_get_by_id/forum_get_by_id/forum_name)">
        <meta name="description" content="{/_R_/site_config/o_board_title}" />
    </xsl:if>

    <xsl:if test="/_R_/_get/nid='login'">
        <meta name="robots" content="noindex, follow"/>
    </xsl:if>
    <title>
      <xsl:value-of select="/_R_/site_config/o_board_title"/>
      <xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
      </xsl:if>
      <xsl:if test="/_R_/topic_get_by_id/topic_get_by_id/subject">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="/_R_/topic_get_by_id/topic_get_by_id/subject"/>
      </xsl:if>
    </title>



    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"/>
    <link rel="stylesheet" type="text/css" href="{$link_prefix}x-dynamic-css"/>
    <script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery-1.3.2.min.js"></script>
    <xsl:if test="not(//runtime/user_agent='bot')">
    <script type="text/javascript" src="{$link_prefix}x-xhtml2dom-js"></script>
    </xsl:if>
    <script type="text/javascript" src="{$link_prefix}x-dynamic-js"></script>
    <script type="text/javascript" src="{$path_prefix}s/js/jsval.js"></script>
    <script type="text/javascript" src="{$path_prefix}s/js/time/relative_time.js"></script>
    <script type="text/javascript" src="http://www-b.evenserver.com/s/js/jquery/plugins/jquery.pir.min.js"></script>
    <xsl:if test="//_get/nid='admin-users' or //_get/nid='index' or //_get/nid='forum'">
    <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
    </xsl:if>
    <xsl:if test="//_get/nid='topic'">
      <link rel="stylesheet" type="text/css" href="{$path_prefix}/s/pkgs/shjs-0.6/sh_style.css"/>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/sh_main.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_xml.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_c.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_sh.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_php.js"></script>
      <script type="text/javascript">
      $(document).ready(function() {
        sh_highlightDocument();
      });
      </script>
    </xsl:if>
    <xsl:if test="contains(/_R_/runtime/user_agent,'msie')">
      <script type="text/javascript">
      $(document).ready(function() {
        $(".tableframe").css("height","280px");
        $(".tableframe").css("width","100%");
      });
      </script>
    </xsl:if>
    <xsl:for-each select="//head_nodes">
      <xsl:sort select="priority" order="ascending"/>
      <xsl:apply-templates select="nodes/*"/>
    </xsl:for-each>
  </head>
  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">head</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="sidebar">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>
  <xsl:param name="my18n"/>
  <xsl:variable name= "forum_get_by_id"
  select="/_R_/forum_get_by_id/forum_get_by_id" />

  <xsl:variable name="topic_get_by_id"
  select="/_R_/topic_get_by_id/topic_get_by_id" />

  <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">main_menu</xsl:with-param>
  </xsl:call-template>

  <div id="sidebar">
  </div>
</xsl:template>

<xsl:template name="head">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">head</xsl:with-param>
  </xsl:call-template>

  <head>
    <xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
        <meta name="description" content="{/_R_/forum_get_by_id/forum_get_by_id/forum_name}: {/_R_/topic_get_by_id/topic_get_by_id/subject}"/>
    </xsl:if>
    <xsl:if test="not(/_R_/forum_get_by_id/forum_get_by_id/forum_name)">
        <meta name="description" content="{/_R_/site_config/o_board_title}" />
    </xsl:if>

    <xsl:if test="/_R_/_get/nid='login'">
        <meta name="robots" content="noindex, follow"/>
    </xsl:if>
    <title>
      <xsl:value-of select="/_R_/site_config/o_board_title"/>
      <xsl:if test="/_R_/forum_get_by_id/forum_get_by_id/forum_name">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
      </xsl:if>
      <xsl:if test="/_R_/topic_get_by_id/topic_get_by_id/subject">
        <xsl:text>: </xsl:text>
        <xsl:value-of select="/_R_/topic_get_by_id/topic_get_by_id/subject"/>
      </xsl:if>
    </title>



    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"/>
    <link rel="stylesheet" type="text/css" href="{$link_prefix}x-dynamic-css"/>
    <script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery-1.3.2.min.js"></script>
    <xsl:if test="not(//runtime/user_agent='bot')">
    <script type="text/javascript" src="{$link_prefix}x-xhtml2dom-js"></script>
    </xsl:if>
    <script type="text/javascript" src="{$link_prefix}x-dynamic-js"></script>
    <script type="text/javascript" src="{$path_prefix}s/js/jsval.js"></script>
    <script type="text/javascript" src="{$path_prefix}s/js/time/relative_time.js"></script>
    <script type="text/javascript" src="http://www-b.evenserver.com/s/js/jquery/plugins/jquery.pir.min.js"></script>
    <xsl:if test="//_get/nid='admin-users' or //_get/nid='index' or //_get/nid='forum'">
    <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="{$path_prefix}s/pkgs/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
    </xsl:if>
    <xsl:if test="//_get/nid='topic'">
      <link rel="stylesheet" type="text/css" href="{$path_prefix}/s/pkgs/shjs-0.6/sh_style.css"/>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/sh_main.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_xml.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_c.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_sh.js"></script>
      <script type="text/javascript" src="{$path_prefix}s/pkgs/shjs-0.6/lang/sh_php.js"></script>
      <script type="text/javascript">
      $(document).ready(function() {
        sh_highlightDocument();
      });
      </script>
    </xsl:if>
    <xsl:if test="contains(/_R_/runtime/user_agent,'msie')">
      <script type="text/javascript">
      $(document).ready(function() {
        $(".tableframe").css("height","280px");
        $(".tableframe").css("width","100%");
      });
      </script>
    </xsl:if>
    <xsl:for-each select="//head_nodes">
      <xsl:sort select="priority" order="ascending"/>
      <xsl:apply-templates select="nodes/*"/>
    </xsl:for-each>
  </head>
  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">head</xsl:with-param>
  </xsl:call-template>
</xsl:template>
<xsl:template name="link_builder">
  <xsl:param name="link_prefix"/>
  <!-- This will concatenate param / value pairs -->
  <xsl:for-each select="//link_params">
    <!-- param = param name = constant -->
    <!-- value = xpath to value or just plain value = variable -->
    <!-- tokens -->
    <!-- order -->
    <xsl:call-template name="the_concatenator">
      <xsl:with-param name="token">/</xsl:with-param>
      <xsl:with-param name="display-param-names">no</xsl:with-param>
      <xsl:with-param name="appendage">.html</xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>

<xsl:template name="the_concatenator">
  <xsl:param name="token"/>
  <xsl:param name="display-param-names">no</xsl:param>
  <xsl:param name="appendage"/>
</xsl:template>
<xsl:template name="footer">
  <xsl:param name="link_prefix"/>
  <xsl:param name="path_prefix"/>
  <xsl:param name="my18n"/>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_start">footer</xsl:with-param>
  </xsl:call-template>

    <!-- Standard div to be replaced by a DOM object -->
    <xsl:if test="contains(/_R_/runtime/user_agent,'gui_browser')">
    <div id="nofooter"/>
    </xsl:if>

    <!-- Raw HTML for bots -->
    <xsl:if test="not(contains(/_R_/runtime/user_agent,'gui_browser'))">
      <p style="text-align: right;">
        Powered by&#160;<a href="http://www.phunkybb.com/blog/" title="Open Source Forums XSL Software">PhunkyBB</a>
        &#160;and&#160;<a href="http://www.nexista.com/blog/" title="Web Application Framework Software">Nexista</a>.
      </p>
    </xsl:if>

  <xsl:call-template name="source_spacer">
    <xsl:with-param name="section_end">footer</xsl:with-param>
  </xsl:call-template>
</xsl:template>
</xsl:stylesheet>
