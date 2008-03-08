<!--
Program: PhunkyBB
Component: personality.xsl
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
<xsl:include href="profile_menu.xsl"/>
<xsl:template name="content">
<div id="profile" class="block2col">
    <xsl:call-template name="profile-menu"/>
	<div class="blockform">
		<h2><span><xsl:value-of select="//runtime/username"/> - </span></h2>
		<div class="box">
			<form id="profile4" method="post" action="{//request_uri}&amp;view_flow=true">
				<div><input type="hidden" name="form_sent" value="1" /></div>
				<div class="inform">
					<fieldset id="profileavatar">
						<legend>Set your avatar display options</legend>
						<div class="infldset">
					<img src="img/avatars/2.jpg" width="55" height="54" alt="" />

					<p>An avatar is a small image that will be displayed with all your posts. You can upload an avatar by clicking the link below. The checkbox 'Use avatar' below must be checked in order for the avatar to be visible in your posts.</p>
							<div class="rbox">
								<label><input type="checkbox" name="form[use_avatar]" value="1" />Use avatar.<br /></label>
							</div>
							<p class="clearb"><a href="">Change avatar</a><a href="">Delete avatar</a></p>
						</div>
					</fieldset>

				</div>
				<div class="inform">
					<fieldset>
						<legend>Compose your signature</legend>
						<div class="infldset">
							<p>A signature is a small piece of text that is attached to your posts. In it, you can enter just about anything you like. Perhaps you would like to enter your favourite quote or your star sign. It's up to you! In your signature you can use BBCode if it is allowed in this particular forum. You can see the features that are allowed/enabled listed below whenever you edit your signature.</p>
							<div class="txtarea">
								<label>Max length: 400 / Max lines: 4<br />

								<textarea name="signature" rows="4" cols="65"><xsl:value-of select="//user_get_profile/signature"/></textarea><br /></label>
							</div>
							<ul class="bblinks">
								<li><a href="help.php#bbcode" onclick="window.open(this.href); return false;">BBCode</a>: on</li>
								<li><a href="help.php#img" onclick="window.open(this.href); return false;">[img] tag</a>: off</li>
								<li><a href="help.php#smilies" onclick="window.open(this.href); return false;">Smilies</a>: on</li>

							</ul>
							<p><xsl:value-of select="//user_get_profile/signature" disable-output-escaping="yes"/>.</p>
						</div>
					</fieldset>
				</div>
				<p><input type="submit" name="update" value="Submit" />When you update your profile, you will be redirected back to this page.</p>
			</form>
		</div>
	<div class="clearer"></div>
    </div>
</div>

</xsl:template>
</xsl:stylesheet>
