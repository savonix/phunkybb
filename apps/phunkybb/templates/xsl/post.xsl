<!--
Program: PhunkyBB
Component: post.xsl
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
<div class="blockform">
	<h2><span>Post new topic</span></h2>
	<div class="box">
		<form id="post" method="post" action="{//link_prefix}topic-submit">
            <input type="hidden" name="fid" value="{//_get/fid}"/>
			<div class="inform">
				<fieldset>
					<legend>Write your message and submit</legend>

					<div class="infldset txtarea">
						<label><strong>Subject</strong><br />
                        <input class="longinput" type="text" name="subject" value="" size="80" maxlength="70" tabindex="1" /><br /></label>
						<label><strong>Message</strong><br />
						<textarea name="message" rows="20" cols="95" tabindex="2"></textarea><br /></label>
						<ul class="bblinks">

							<li><a href="help.php#bbcode" onclick="window.open(this.href); return false;">BBCode</a>: on</li>
							<li><a href="help.php#img" onclick="window.open(this.href); return false;">[img] tag</a>: on</li>
							<li><a href="help.php#smilies" onclick="window.open(this.href); return false;">Smilies</a>: on</li>
						</ul>
					</div>
				</fieldset>

			</div>
			<div class="inform">
				<fieldset>
					<legend>Options</legend>
					<div class="infldset">
						<div class="rbox">
							<label><input type="checkbox" name="hide_smilies" value="1" tabindex="3" />Never show smilies as icons for this post<br /></label>
				<label><input type="checkbox" name="subscribe" value="1" tabindex="4" />Subscribe to this topic<br /></label>

						</div>
					</div>
				</fieldset>
			</div>
			<p><input type="submit" name="submit" value="Submit" tabindex="5" accesskey="s" /><input type="submit" name="preview" value="Preview" tabindex="6" accesskey="p" /><a href="javascript:history.go(-1)">Go back</a></p>
		</form>
	</div>
</div>



</xsl:template>
</xsl:stylesheet>