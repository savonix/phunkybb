<!--
Program: PhunkyBB
Component: user_admin.xsl
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
<div id="adminconsole" class="block2col">
    <xsl:call-template name="profile-menu"/>
	<div class="blockform">
		<h2><span><xsl:value-of select="//runtime/username"/> - </span></h2>
		<div class="box">
			<form id="profile7" method="post" action="profile.php?section=admin&amp;id=2&amp;action=foo">
				<div class="inform">
				<input type="hidden" name="form_sent" value="1" />
					<fieldset>
						<legend>Delete (administrators only) or ban user</legend>
						<div class="infldset">
							<input type="submit" name="delete_user" value="Delete user" /><input type="submit" name="ban" value="Ban user" />

						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Set moderator access</legend>
						<div class="infldset">
							<p>Choose what forums this user should be allowed to moderate. Note: This only applies to moderators. Administrators always have full permissions in all forums.</p>

							<div class="conl">
								<p><strong>Test category</strong></p>
								<div class="rbox">
									<label><input type="checkbox" name="moderator_in[3]" value="1" />New forum2<br /></label>

									<label><input type="checkbox" name="moderator_in[2]" value="1" />New forum<br /></label>
								</div>
							</div>

							<br class="clearb" /><input type="submit" name="update_forums" value="Update forums" />
						</div>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
	<div class="clearer"></div>
</div>
</xsl:template>
</xsl:stylesheet>
