<!--
Program: PhunkyBB
Component: display.xsl
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
		<h2><xsl:value-of select="//runtime/username"/> - <xsl:value-of select="//label[key=//_get/nid]/value"/></h2>
		<div class="box">
			<form id="profile5" method="post">
				<div><input type="hidden" name="form_sent" value="1" /></div>
				<div class="inform">
					<fieldset>
						<legend>Select your preferred style</legend>
						<div class="infldset">
							<label>If you like you can use a different visual style for this forum.<br/>
							<select name="form[style]">
								<option value="Oxygen" selected="selected">Oxygen</option>
							</select>
							<br/></label>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>

						<legend>Set your options for viewing posts</legend>
						<div class="infldset">
							<p>If you are on a slow connection, disabling these options, particularly showing images in posts and signatures, will make pages load faster.</p>
							<div class="rbox">
								<label><input type="checkbox" name="form[show_smilies]" value="1" checked="checked" />Show smilies as graphic icons<br/></label>
								<label><input type="checkbox" name="form[show_sig]" value="1" checked="checked" />Show user signatures.<br/></label>
							<label><input type="checkbox" name="form[show_avatars]" value="1" checked="checked" />Show user avatars in posts.<br/></label>

								<label><input type="checkbox" name="form[show_img]" value="1" checked="checked" />Show images in posts.<br/></label>
								<label><input type="checkbox" name="form[show_img_sig]" value="1" checked="checked" />Show images in user signatures.<br/></label>
							</div>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>

						<legend>Enter your pagination options</legend>
						<div class="infldset">
							<label class="conl">Topics<br/><input type="text" name="form[disp_topics]" value="" size="6" maxlength="3" /><br/></label>
							<label class="conl">Posts<br/><input type="text" name="form[disp_posts]" value="" size="6" maxlength="3" /><br/></label>
							<p class="clearb">Enter the number of topics and posts you wish to view on each page. Leave blank to use forum default.</p>
						</div>
					</fieldset>

				</div>
				<p><input type="submit" name="update" value="Submit" />  When you update your profile, you will be redirected back to this page.</p>
			</form>
		</div>
	<div class="clearer"></div>
    </div>
</div>

</xsl:template>
</xsl:stylesheet>
