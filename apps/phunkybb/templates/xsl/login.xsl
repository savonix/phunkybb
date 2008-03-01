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
	<h2><span>Login</span></h2>

	<div class="box">
		<form id="login" method="post" action="{//link_prefix}login&amp;view_flow=true">
			<div class="inform">
				<fieldset>
					<legend>Enter your username and password below</legend>
						<div class="infldset">
							<label class="conl"><strong>Username</strong><br /><input type="text" name="username" size="25" maxlength="25" tabindex="1" /><br /></label>
							<label class="conl"><strong>Password</strong><br /><input type="password" name="password" size="16" maxlength="16" tabindex="2" /><br /></label>
							<p class="clearb">If you have not registered or have forgotten your password click on the appropriate link below.</p>
							<p><a href="{//link_prefix}register" tabindex="4">Not registered yet?</a>
							<!--  <a href="" tabindex="5">Forgotten your password?</a> -->
                            </p>
						</div>

				</fieldset>
			</div>
			<p><input type="submit" name="login" value="Login" tabindex="3" /></p>
		</form>
	</div>
</div>

</xsl:template>
</xsl:stylesheet>
