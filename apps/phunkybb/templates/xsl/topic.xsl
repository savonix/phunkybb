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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="main.xsl"/>
<xsl:template name="content">
<script src="/phunkybbweb/s/js/jquery-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
function delete_post(post_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-post-delete&amp;post_id="+post_id, {'post_id': post_id}, 
    function (data){
    });
    myDiv = document.getElementById("p"+post_id);
    myDiv.innerHTML = "";
    }
}
</script>
<div class="linkst">
	<div class="inbox">
		<p class="pagelink conl">Pages: <strong>1</strong></p>
		<p class="postlink conr">&#160;</p>
		<ul><li><a href="{//link_prefix}index">Index</a></li><li>&#160; > &#160; 
        <a href="{//link_prefix}forum&amp;fid={//_get/fid}"><xsl:value-of select="//forum_get_by_id/forum_name"/></a>
        <a href="{//link_prefix}forum&amp;id={//_get/id}"></a></li><li>&#160;&gt;&#160;<xsl:value-of select="//topic_get_by_id/subject"/></li></ul>
		<div class="clearer"></div>
	</div>
</div>


<xsl:for-each select="//posts_get_by_topic_id">
<div id="p{id}" class="blockpost roweven">
	<h2><span><span class="conr">#<xsl:value-of select="id"/></span>
    <a href="#post{id}" name="post{id}"><xsl:value-of select="posted"/></a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postleft">
				<dl>
					<dt><strong><a href="{//link_prefix}profile&amp;id={poster_id}">
                    <xsl:value-of select="username"/></a></strong></dt>
					<!--
                    <dd class="usertitle"><strong>Administrator</strong></dd>

					<dd class="postavatar"></dd>
					<dd>Registered: </dd>
					<dd>Posts: 22</dd>-->
				</dl>
			</div>
			<div class="postright">

				<div class="postmsg">
					<p><xsl:value-of select="message" disable-output-escaping="yes"/></p>
				</div>
			</div>
			<div class="clearer"></div>
			<div class="postfootright"><div>
                <xsl:if test="//runtime/group_id=1 or poster=//runtime/username">
                    <a href="#">Edit</a>&#160;
                    <a href="{//link_prefix}x-post-delete&amp;post_id={id}" onclick="delete_post({id}); return false;">Delete</a>
                </xsl:if>
            </div></div>
		</div>

	</div>
</div>
</xsl:for-each>

<xsl:if test="//runtime/username">
<div class="blockform">
	<h2><span>Quick post</span></h2>
	<div class="box">
		<form method="post" action="{//link_prefix}post&amp;tid={//_get/id}&amp;view_flow=true" >
			<div class="inform">

				<fieldset>
					<legend>Write your message and submit</legend>
					<div class="infldset txtarea">
						<input type="hidden" name="topic_id" value="{//_get/id}" />
						<input type="hidden" name="forum_id" value="{//_get/fid}" />
						<label><textarea name="message" rows="7" cols="75" tabindex="1"></textarea></label>
					</div>
				</fieldset>
			</div>
			<p><input type="submit" name="submit" tabindex="2" value="Submit" accesskey="s" /></p>

		</form>
	</div>
</div>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
