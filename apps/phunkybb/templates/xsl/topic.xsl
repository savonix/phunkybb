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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="prev_next.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>

		<xsl:variable name="topic_get_by_id"
			select="/_R_/topic_get_by_id/topic_get_by_id"/>

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
				myDiv = document.getElementById("p"+post_id);
				myDiv.innerHTML = "";
				}
		}
		function delete_topic(topic_id) {
				if(confirm('Are you sure?')){
				$.post("<xsl:value-of select="$link_prefix"/>x-topic-delete&amp;topic_id="+topic_id,
				{
						'topic_id': topic_id
				},
				function (data){
						window.location ='<xsl:value-of select="$link_prefix"/>welcome';
				});
				}
		}
		</script>
		<xsl:variable name="this_forum"
			select="/_R_/forum_get_by_id/forum_get_by_id"/>
		<xsl:variable name="page_num"
			select="/_R_/posts_get_number_of_pages/posts_get_number_of_pages"/>

		<div class="linkst">
			<div class="inbox">
				<p class="pagelink conl">
					<xsl:value-of select="$my18n/pages"/>:
					<strong>
						<xsl:value-of select="format-number($page_num/pages,'##')"/>
					</strong>&#160;

      <xsl:value-of select="$my18n/posts"/>:
      <strong>
        <xsl:value-of select="$page_num/count"/>
			</strong>
			</p>
			<p class="postlink conr">
				<xsl:value-of select="$topic_get_by_id/subject"/>
        &#160;
        <xsl:if test="/_R_/runtime/group_id=1">
          <a href="{$link_prefix}topic-delete&amp;topic_id={$topic_get_by_id/id}&amp;fid={/_R_/forum_get_by_id/forum_get_by_id/id}"
            onclick="delete_topic({$topic_get_by_id/id}); return false;">
            Delete
          </a>
          <a href="{$link_prefix}topic-edit&amp;topic_id={$topic_get_by_id/id}&amp;fid={/_R_/forum_get_by_id/forum_get_by_id/id}">
            Move
          </a>
        </xsl:if>
				</p>
				<ul class="breadcrumbs">
					<li>
						<a href="{$link_prefix}index">
							<xsl:value-of select="$my18n/index"/>
						</a>
					</li>
				<li>&#160; &gt; &#160;
        <a href="{$link_prefix}forum&amp;forum_basename={$this_forum/forum_basename}&amp;fid={$this_forum/id}"
					title="{$this_forum/forum_name}">
          <xsl:value-of select="$this_forum/forum_name"/>
				</a>
				</li>
				<li>
        &#160; &gt; &#160;
        <a href="{$link_prefix}topic&amp;forum_basename={$this_forum/forum_basename}&amp;fid={$this_forum/id}&amp;id={$topic_get_by_id/id}">
          <xsl:value-of select="$topic_get_by_id/subject"/>
				</a>
				</li>
				</ul>
				<p class="postlink conl">
					<xsl:if test="($page_num/count * 0.1) &gt; 1">
						<xsl:call-template name="previous_next">
							<xsl:with-param name="link_prefix" select="$link_prefix"/>
							<xsl:with-param name="qsa">
								<xsl:text>&amp;fid=</xsl:text>
								<xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/id"/>
								<xsl:text>&amp;id=</xsl:text>
								<xsl:value-of select="$topic_get_by_id/id"/>
							</xsl:with-param>
							<xsl:with-param name="max" select="$page_num/count"/>
						</xsl:call-template>
					</xsl:if>
				</p>
			</div>
		</div>

		<!-- Post loop -->
		<xsl:for-each select="/_R_/posts_get_by_topic_id/posts_get_by_topic_id">
			<div id="p{id}" class="blockpost roweven">
				<h2>
					<a href="#post{id}" name="post{id}"><span class="conr">#<xsl:value-of select="id"/></span></a>
						<a href="#post{id}" name="post{id}">
							<span class="date">
								<xsl:value-of select="posted"/>
							</span>
						</a>
				</h2>
				<div class="box">
					<div class="inbox">
						<div class="postleft">
							<!-- This is where the avatar would go. -->
							<xsl:if test="not(picture='')">
								<img width="50" height="50" src="{picture}" alt="{username}'s avatar"/>
								<br/>
							</xsl:if>
							<strong>
								<a href="{$link_prefix}profile&amp;id={id}">
									<xsl:value-of select="username"/>
								</a>
							</strong>
						</div>
						<div class="postright">
							<div class="postmsg">
								<p>
									<xsl:value-of select="message" disable-output-escaping="yes"/>
								</p>
								<hr/>
								<p>
									<xsl:value-of select="signature" disable-output-escaping="yes"/>
								</p>
							</div>
						</div>
						<div class="postfootright">
							<div>
								<xsl:if test="//runtime/group_id=1 or poster=/_R_/runtime/username">
									<a href="{$link_prefix}post-edit&amp;post_id={id}&amp;topic_id={$topic_get_by_id/id}&amp;fid={/_R_/forum_get_by_id/forum_get_by_id/id}">
										<xsl:value-of select="$my18n/edit"/>
									</a>&#160;
									<a href="{$link_prefix}x-post-delete&amp;post_id={id}"
										onclick="delete_post({id}); return false;">
										<xsl:value-of select="$my18n/delete"/>
									</a>
								</xsl:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:for-each>

	<div class="linkst">
		<div class="inbox">
			<p class="postlink conl">
				<xsl:if test="($page_num/count * 0.1) &gt; 1">
					<xsl:call-template name="previous_next">
						<xsl:with-param name="link_prefix" select="$link_prefix"/>
						<xsl:with-param name="qsa">
							<xsl:text>&amp;fid=</xsl:text>
							<xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/id"/>
							<xsl:text>&amp;id=</xsl:text>
							<xsl:value-of select="$topic_get_by_id/id"/>
						</xsl:with-param>
						<xsl:with-param name="max">
							<xsl:value-of select="$page_num/count"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</p>
		</div>
	</div>
		<!-- Reply -->
		<xsl:if test="/_R_/runtime/username">
			<div class="blockform">
				<h2>
					<xsl:value-of select="$my18n/quick_post"/>
				</h2>
				<div class="box">
					<form method="post" action="{$link_prefix}post&amp;tid={$topic_get_by_id/id}">
						<div class="inform">
							<fieldset>
								<legend>
									<xsl:value-of select="$my18n/write_your_message"/>
								</legend>
								<div class="infldset txtarea">
									<input type="hidden" name="topic_id" value="{$topic_get_by_id/id}"/>
									<input type="hidden" name="num_replies" value="{count(//posts_get_by_topic_id)}"/>
									<input type="hidden" name="forum_id" value="{/_R_/forum_get_by_id/forum_get_by_id/id}"/>
									<label>
										<textarea name="message" rows="7" cols="75"></textarea>
									</label>
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
