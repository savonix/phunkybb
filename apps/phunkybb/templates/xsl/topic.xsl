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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="html_main.xsl"/>
<xsl:include href="prev_next.xsl"/>
<xsl:template name="content">
<xsl:param name="link_prefix"/>
<xsl:param name="my18n"/>

<script type="text/javascript">
function delete_post(post_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="$link_prefix"/>x-post-delete&amp;post_id="+post_id,
    {
        'post_id': post_id,
        'num_replies': <xsl:value-of select="count(/_R_/posts_get_by_topic_id/posts_get_by_topic_id)-1"/>,
        'topic_id': <xsl:value-of select="/_R_/_get/id"/>
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

<div class="linkst">
	<div class="inbox">
		<p class="pagelink conl">
      <xsl:value-of select="$my18n/p/pages"/>:
      <strong>
        <xsl:value-of select="/_R_/posts_get_number_of_pages/posts_get_number_of_pages/pages"/>
      </strong>&#160;
      <xsl:value-of select="$my18n/p/posts"/>:
      <strong>
        <xsl:value-of select="/_R_/posts_get_number_of_pages/posts_get_number_of_pages/count"/>
      </strong>
    </p>
    <p class="postlink conr">
      <xsl:value-of select="/_R_/topic_get_by_id/topic_get_by_id/subject"/>
      &#160;
      <xsl:if test="/_R_/runtime/group_id=1">
        <a href="{$link_prefix}topic-delete&amp;topic_id={/_R_/_get/id}&amp;fid={/_R_/_get/fid}"
          onclick="delete_topic({/_R_/_get/id}); return false;">
          Delete
        </a>
        <a href="{$link_prefix}topic-edit&amp;topic_id={/_R_/_get/id}&amp;fid={/_R_/_get/fid}">
          Move
        </a>
      </xsl:if>
    </p>
    <ul class="breadcrumbs">
      <li>
        <a href="{$link_prefix}index">
          <xsl:value-of select="$my18n/i/index"/>
        </a>
      </li>
      <li>&#160; &gt; &#160;
        <a href="{$link_prefix}forum&amp;fid={/_R_/_get/fid}">
          <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
        </a>
      </li>
      <li>
        &#160; &gt; &#160;
        <a href="{$link_prefix}topic&amp;fid={/_R_/_get/fid}&amp;id={/_R_/_get/id}">
          <xsl:value-of select="/_R_/topic_get_by_id/topic_get_by_id/subject"/>
        </a>
      </li>
    </ul>
    <p class="postlink conl">
      <xsl:if test="//posts_get_number_of_pages/count &gt; 2">
        <xsl:call-template name="previous_next">
          <xsl:with-param name="link_prefix">
            <xsl:value-of select="$link_prefix"/>
          </xsl:with-param>
          <xsl:with-param name="qsa">
            <xsl:text>&amp;fid=</xsl:text>
            <xsl:value-of select="/_R_/_get/fid"/>
            <xsl:text>&amp;id=</xsl:text>
            <xsl:value-of select="/_R_/_get/id"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </p>
  </div>
</div>

<!-- Post loop -->
<xsl:for-each select="/_R_/posts_get_by_topic_id/posts_get_by_topic_id">
<div id="p{id}" class="blockpost roweven">
	<h2><span class="conr">#<xsl:value-of select="id"/></span>
    <a href="#post{id}" name="post{id}">
      <xsl:value-of select="posted"/>
    </a>
  </h2>
	<div class="box">
		<div class="inbox">
			<div class="postleft">
				<dl>
					<dt>
            <strong>
              <a href="{$link_prefix}profile&amp;id={poster_id}">
                <xsl:value-of select="username"/>
              </a>
            </strong>
          </dt>
      </dl>
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
            <a href="{$link_prefix}post-edit&amp;post_id={id}&amp;fid={//_get/fid}&amp;tid={//_get/id}">
              <xsl:value-of select="$my18n/e/edit"/></a>&#160;
            <a href="{$link_prefix}x-post-delete&amp;post_id={id}"
              onclick="delete_post({id}); return false;">
              <xsl:value-of select="$my18n/d/delete"/>
            </a>
          </xsl:if>
        </div>
      </div>
		</div>
	</div>
</div>
</xsl:for-each>

    <p class="postlink conl">
      <xsl:if test="//posts_get_number_of_pages/count &gt; 2">
        <xsl:call-template name="previous_next">
          <xsl:with-param name="link_prefix">
            <xsl:value-of select="$link_prefix"/>
          </xsl:with-param>
          <xsl:with-param name="qsa">
            <xsl:text>&amp;fid=</xsl:text>
            <xsl:value-of select="/_R_/_get/fid"/>
            <xsl:text>&amp;id=</xsl:text>
            <xsl:value-of select="/_R_/_get/id"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </p>

<!-- Reply -->
<xsl:if test="/_R_/runtime/username">
<div class="blockform">
	<h2><xsl:value-of select="$my18n/q/quick_post"/></h2>
	<div class="box">
		<form method="post" action="{$link_prefix}post&amp;tid={/_R_/_get/id}">
			<div class="inform">
				<fieldset>
					<legend>
            <xsl:value-of select="$my18n/w/write_your_message"/>
          </legend>
					<div class="infldset txtarea">
						<input type="hidden" name="topic_id" value="{/_R_/_get/id}"/>
						<input type="hidden"
              name="num_replies" value="{count(//posts_get_by_topic_id)}"/>
						<input type="hidden" name="forum_id" value="{/_R_/_get/fid}"/>
						<label>
              <textarea name="message" rows="7" cols="75"></textarea>
            </label>
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
