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
<div class="linkst">
	<div class="inbox">
		<p class="pagelink conl">Pages: <strong>1</strong></p>

		<p class="postlink conr">&#160;</p>
		<ul><li><a href="{//link_prefix}index">Index</a></li><li>&#160; - &#160; <a href="{//link_prefix}forum&amp;fid={//_get/fid}"><xsl:value-of select="//forum_get_by_id/forum_name"/></a>
        <a href="{//link_prefix}forum&amp;id={//_get/id}"></a></li><li>&#160;&gt;&#160;testing 123</li></ul>
		<div class="clearer"></div>
	</div>
</div>


<xsl:for-each select="//posts_get_by_topic_id">
<div id="p6" class="blockpost roweven">
	<h2><span><span class="conr">#<xsl:value-of select="id"/></span><a href="{//link_prefix}index"><xsl:value-of select="posted"/></a></span></h2>
	<div class="box">
		<div class="inbox">
			<div class="postleft">
				<dl>
					<dt><strong><a href="{//link_prefix}profile&amp;id={poster_id}">demo</a></strong></dt>
					<dd class="usertitle"><strong>Administrator</strong></dd>

					<dd class="postavatar"></dd>
					<dd>Registered: 2008-02-07</dd>
					<dd>Posts: 22</dd>
				</dl>
			</div>
			<div class="postright">
				<h3> Re: testing 123</h3>

				<div class="postmsg">
					<p><xsl:value-of select="message"/></p>
				</div>
			</div>
			<div class="clearer"></div>
			<div class="postfootleft"><p><strong>Online</strong></p></div>
			<div class="postfootright"><div></div></div>
		</div>

	</div>
</div>
</xsl:for-each>

<xsl:if test="//runtime/username">
<div class="blockform">
	<h2><span>Quick post</span></h2>
	<div class="box">
		<form method="post" action="{//link_prefix}post&amp;tid={//_get/id}" >
			<div class="inform">

				<fieldset>
					<legend>Write your message and submit</legend>
					<div class="infldset txtarea">
						<input type="hidden" name="topic_id" value="{//_get/id}" />
						<label><textarea name="message" rows="7" cols="75" tabindex="1"></textarea></label>
						<ul class="bblinks">
							<li><a href="help.php#bbcode" onclick="window.open(this.href); return false;">BBCode</a>: on</li>

							<li><a href="help.php#img" onclick="window.open(this.href); return false;">[img] tag</a>: on</li>
							<li><a href="help.php#smilies" onclick="window.open(this.href); return false;">Smilies</a>: on</li>
						</ul>
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