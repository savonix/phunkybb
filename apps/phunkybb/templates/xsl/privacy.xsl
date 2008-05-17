<!--
Program: PhunkyBB
Component: privacy.xsl
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
		<h2><xsl:value-of select="//runtime/username"/></h2>
		<div class="box">
			<form id="profile6" method="post">
				<div class="inform">
					<fieldset>
						<legend>Set your privacy options</legend>
						<div class="infldset">
							<input type="hidden" name="form_sent" value="1"/>
							<p>Select whether you want your e-mail address to be viewable to other users or not and if you want other users to be able to send you e-mail via the forum (form e-mail) or not.</p>

							<div class="rbox">
								<label><input type="radio" name="form[email_setting]" value="0"/>Display your e-mail address.<br/></label>
								<label><input type="radio" name="form[email_setting]" value="1" checked="checked"/>Hide your e-mail address but allow form e-mail.<br/></label>
								<label><input type="radio" name="form[email_setting]" value="2"/>Hide your e-mail address and disallow form e-mail.<br/></label>
							</div>
							<p>This option sets whether the forum should "remember" you between visits. If enabled, you will not have to login every time you visit the forum. You will be logged in automatically. Recommended.</p>
							<div class="rbox">

								<label><input type="checkbox" name="form[save_pass]" value="1" checked="checked"/>Save username and password between visits.<br/></label>
							</div>
							<p>With this enabled, a plain text version of the new post will be included in subscription notification e-mails.</p>
							<div class="rbox">
								<label><input type="checkbox" name="form[notify_with_post]" value="1"/>Include post in subscription e-mails.<br/></label>
							</div>
						</div>

					</fieldset>
				</div>
				<p><input type="submit" name="update" value="Submit"/>When you update your profile, you will be redirected back to this page.</p>
			</form>
		</div>
	<div class="clearer"></div>
    </div>
</div>

</xsl:template>
</xsl:stylesheet>
