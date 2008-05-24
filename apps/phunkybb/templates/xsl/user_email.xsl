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
		<h2><xsl:value-of select="//runtime/username"/></h2>
		<div class="box">
			<form id="profile7" method="post">
                <input type="hidden" name="user_id" value="{//_get/user_id}"/>
				<div class="inform">
					<fieldset>
						<legend>Enter a valid e-mail address</legend>
						<div class="infldset">
							<label><strong><xsl:value-of select="//label[key='email']/value"/></strong><br/>
                            <input type="text" name="rcpt_email" value="{//user_get_profile/email}" readonly="readonly"/>
                            <br/>
                            </label>
						</div>
                        <input type="text" name="subject"/>
                        <br/>
                        <textarea name="message"/>
                        <br/>
                        <input type="submit"/>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</div>
</xsl:template>
</xsl:stylesheet>
