<!--
Program: PhunkyBB
Component: topic.xsl
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
  <xsl:include href="prev_next.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="my18n"/>
		
    <xsl:variable
        name="topic_get_by_id"
        select="/_R_/topic_get_by_id/topic_get_by_id" />
    <xsl:variable
        name="forum_get_by_id"
        select="/_R_/forum_get_by_id/forum_get_by_id" />
    <xsl:variable
        name="page_num"
        select="/_R_/posts_get_number_of_pages/posts_get_number_of_pages" />

    <xsl:if test="/_R_/runtime/group_id=1">
      <script type="text/javascript">
		function delete_post(post_id) {
				if(confirm('Are you sure?')){
				$.post("<xsl:value-of select="$link_prefix"/>x-post-delete&amp;post_id="+post_id,
				{
						'post_id': post_id,
						'num_replies': <xsl:value-of select="count(/_R_/posts_get_by_topic_id/posts_get_by_topic_id)-1"/>,
						'topic_id': <xsl:value-of select="$topic_get_by_id/id"/>
				},
				function (data){
				});
				$("#p"+post_id).hide("normal",function() {$("#p"+post_id).remove();});
				}
		}
		</script>
    </xsl:if>


    <table cellspacing="0">
      <tr>
        <th class="tcl" style="border-bottom: 0;">
          <span class="postlink conr">
            <xsl:if test="contains(//user_agent,'gui_browser')">
              <span style="float:right;padding:6px;margin-top:-1px;">
                <a href="{$link_prefix}x-topic-rss&amp;id={$topic_get_by_id/id}&amp;fid={$forum_get_by_id/id}">
                  <img src="{$path_prefix}s/img/icons/famfamfam/rss.png" alt="RSS"/>
                </a>
              </span>
            </xsl:if>
            <xsl:if test="($page_num/count * 0.1) &gt; 1">
              <xsl:call-template name="previous_next">
                <xsl:with-param name="link_prefix" select="$link_prefix"/>
                <xsl:with-param name="qsa">
                  <xsl:text>&amp;fid=</xsl:text>
                  <xsl:value-of select="$forum_get_by_id/id"/>
                  <xsl:text>&amp;id=</xsl:text>
                  <xsl:value-of select="$topic_get_by_id/id"/>
                </xsl:with-param>
                <xsl:with-param name="max" select="$page_num/count"/>
              </xsl:call-template>
          Pages:
          <xsl:call-template name="pages">
            <xsl:with-param name="link_prefix" select="$link_prefix"/>
                <xsl:with-param name="qsa">
                  <xsl:text>&amp;fid=</xsl:text>
                  <xsl:value-of select="$forum_get_by_id/id"/>
                  <xsl:text>&amp;id=</xsl:text>
                  <xsl:value-of select="$topic_get_by_id/id"/>
                </xsl:with-param>
                <xsl:with-param name="max" select="$page_num/count"/>
                <xsl:with-param name="number_of_pages" select="format-number($page_num/pages,'##') - 1"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="/_R_/runtime/username or /_R_/site_config/o_anonymous_replies='on'">
              <a href="#" onclick="show_quickpost();">
            Reply</a>&#160;
        </xsl:if>
            <xsl:if test="/_R_/runtime/group_id=1">
              <a href="#x-topic-delete&amp;topic_id={$topic_get_by_id/id}&amp;fid={$forum_get_by_id/id}"
                  onclick="topic_delete({$topic_get_by_id/id}); return false;">
            Delete</a>&#160;
          <a href="{$link_prefix}topic-edit&amp;id={$topic_get_by_id/id}&amp;fid={$forum_get_by_id/id}">
            Move
          </a>
            </xsl:if>
          </span>
          <b>
            <xsl:value-of select="$topic_get_by_id/subject"/>
          </b>
            has <xsl:value-of select="format-number($page_num/pages,'##')"/>&#160;<xsl:value-of select="$my18n/pages"/>
            and
           <xsl:value-of select="$page_num/count"/>&#160;<xsl:value-of select="$my18n/posts"/>
        </th>
      </tr>
    </table>
		<!-- Post loop -->
    <div class="tableframe">
      <xsl:for-each select="/_R_/posts_get_by_username/posts_get_by_username">
        <a href="#post{id}" name="post{id}" />
        <div id="p{id}" class="post">
          <div style="float:left;" class="post-avatar">
            <xsl:if test="/_R_/runtime/username">
              <xsl:attribute name="class">user-avatar</xsl:attribute>
              <xsl:attribute name="onclick">location.href='<xsl:value-of select="$link_prefix"/>public-profile&amp;username=<xsl:value-of select="username"/>'</xsl:attribute>
            </xsl:if>
            <!-- This is where the avatar would go. -->
            <xsl:if test="not(picture='')">
              <img class="post-avatar" src="{picture}" alt="{username}'s avatar"/>
            </xsl:if>
            <xsl:if test="picture=''">
              <img class="post-avatar" src="{$path_prefix}s/img/avatars/default-userpic-50.jpg" alt=""/>
            </xsl:if>
          </div>
          <div class="post-meta">
            <span class="post-controls noul">
              <xsl:if test="/_R_/runtime/username=username or /_R_/runtime/group_id=1">
                <a href="{$link_prefix}post-edit&amp;post_id={id}&amp;topic_id={$topic_get_by_id/id}&amp;fid={$forum_get_by_id/id}">
                  <xsl:value-of select="$my18n/edit"/>
                </a>&#160;
            <a href="{$link_prefix}x-post-delete&amp;post_id={id}"
                    onclick="delete_post({id}); return false;">
              <xsl:value-of select="$my18n/delete"/>
                </a>
              </xsl:if>
            </span>
            <span class="noul">
              <a href="#post{id}" class="noul">
                <xsl:value-of select="username"/> posted
              <span class="reldate">
                <xsl:value-of select="posted"/>
                </span>
              </a>&#160;
          </span>
          </div>
          <div class="post-message">
            <xsl:value-of select="message" disable-output-escaping="yes"/>
          </div>
        <!--
        <div class="postmsgsig">
          <xsl:value-of select="signature" disable-output-escaping="yes"/>
        </div>
        -->
        </div> <!-- end post -->
      </xsl:for-each>
    </div>

		<!-- Reply -->
    <xsl:if test="/_R_/runtime/username or /_R_/site_config/o_anonymous_replies='on'">
      <div class="blockform" id="quickpost">
        <h2>
          <span style="float:right;cursor:pointer;" onclick="hide_quickpost();">
          X
          </span>
          <xsl:value-of select="$my18n/quick_post"/>
        </h2>
        <div class="box">
          <form method="post" action="{$link_prefix}post&amp;tid={$topic_get_by_id/id}">
            <div class="inform">
              <xsl:if test="not(/_R_/runtime/username)">
              Email: <input type="text" name="anonymous_email"/>
                <br/>
              </xsl:if>
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/write_your_message"/>
                </legend>
                <div class="infldset txtarea">
                  <input type="hidden" name="topic_id" value="{$topic_get_by_id/id}"/>
                  <input type="hidden" name="forum_id" value="{/_R_/forum_get_by_id/forum_get_by_id/id}"/>
                  <input type="hidden" name="site_id" value="{/_R_/runtime/site_id}"/>
                  <textarea name="message" rows="7" cols="75"/>
                </div>
              </fieldset>
            </div>
            <div class="inform">
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/options"/>
                </legend>
                <div class="infldset">
                  <div class="rbox">
                    <label>
                      <input type="checkbox" name="subscribe">
                        <xsl:if test="/_R_/topic_get_subscriptions/topic_get_subscriptions/user_id=/_R_/runtime/user_id">
                          <xsl:attribute name="checked" value="checked"/>
                        </xsl:if>
                      </input>
                      <xsl:value-of select="$my18n/subscribe"/>
                      <br/>
                    </label>
                  </div>
                </div>
              </fieldset>
            </div>
            <p>
              <input type="submit" name="submit" value="Submit"/>
            </p>
          </form>
        </div>
      </div>
    </xsl:if>
    

	
  </xsl:template>
</xsl:stylesheet>
