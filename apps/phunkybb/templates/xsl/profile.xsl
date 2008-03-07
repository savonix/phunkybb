<!--
Program: PhunkyBB
Component: profile.xsl
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
		<h2><span><xsl:value-of select="//runtime/username"/> - Essentials</span></h2>

		<div class="box">
			<form id="profile1" method="post" action="profile.php?section=essentials&amp;id=2" onsubmit="return process_form(this)">
				<div class="inform">
					<fieldset>
						<legend>Enter your username and password</legend>
						<div class="infldset">
							<input type="hidden" name="form_sent" value="1" />
							<input type="hidden" name="old_username" value="demo" />
                            <label><strong>Username</strong><br />
                            <input type="text" name="req_username" value="{//user_get_profile/username}" size="25" maxlength="25" /><br />
                            </label>
                        <p><a href="#">Change password</a></p>
					</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Enter a valid e-mail address</legend>
						<div class="infldset">

							<label><strong>E-mail</strong><br /><input type="text" name="req_email" value="{//user_get_profile/email}" size="40" maxlength="50" /><br /></label><p><a href="misc.php?email=2">Send e-mail</a></p>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Set your localisation options</legend>

						<div class="infldset">
							<label>Timezone: For the forum to display times correctly you must select your local timezone.							<br /><select name="form[timezone]">
								<option value="-12">-12</option>
							</select>
							<br /></label>
						</div>
					</fieldset>

				</div>
				<div class="inform">
					<fieldset>
						<legend>User activity</legend>
						<div class="infldset">
							<p>Registered: <xsl:value-of select="registered"/> (<a href="moderate.php?get_host="></a>)</p>
							<p>Last post: 2008-02-24 08:08:56</p>

								<label>Posts<br /><input type="text" name="num_posts" value="22" size="8" maxlength="8" /><br /></label>
							<label>Admin note<br />
							<input id="admin_note" type="text" name="admin_note" value="{//user_get_profile/admin_note}" size="30" maxlength="30" /><br /></label>
						</div>
					</fieldset>
				</div>
				<p><input type="submit" name="update" value="Submit" />
                When you update your profile, you will be redirected back to this page.</p>

			</form>
		</div>
	</div>
	<div class="clearer"></div>
</div>

</xsl:template>
</xsl:stylesheet>
