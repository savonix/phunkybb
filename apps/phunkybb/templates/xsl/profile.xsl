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
		<h2>
            <xsl:value-of select="//runtime/username"/> - <xsl:value-of select="//label[key='essentials']/value"/>
        </h2>
		<div class="box">
			<form id="profile1" method="post" onsubmit="return process_form(this)">
				<div class="inform">
					<fieldset>
						<legend>Enter your username and password</legend>
						<div class="infldset">
							<input type="hidden" name="form_sent" value="1"/>
							<input type="hidden" name="old_username" value="demo"/>
                            <label><strong><xsl:value-of select="//label[key='username']/value"/></strong><br/>
                            <input type="text" name="req_username" value="{//user_get_profile/username}"/><br/>
                            </label>
                        <p><a href="#">Change password</a></p>
                        </div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Enter a valid e-mail address</legend>
						<div class="infldset">
							<label><strong><xsl:value-of select="//label[key='email']/value"/></strong><br/>
                            <input type="text" name="req_email" value="{//user_get_profile/email}"/><br/>
                            </label>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend><xsl:value-of select="//label[key='user_activity']/value"/></legend>
						<div class="infldset">
                            <xsl:if test="//runtime/group_id=1">
                            <p>
                                <xsl:value-of select="//label[key='registration_ip']/value"/>:
                                <a href="http://www.arin.net/?queryinput={//user_get_profile/registration_ip}"
                                    target="_blank">
                                    <xsl:value-of select="//user_get_profile/registration_ip"/>
                                </a>
                            </p>
                            </xsl:if>
							<p>
                                <xsl:value-of select="//label[key='registered']/value"/>:
                                <xsl:value-of select="//user_get_profile/registered"/>
                            </p>
							<p>
                                <xsl:value-of select="//label[key='last_visit']/value"/>:
                                <xsl:value-of select="//user_get_profile/last_visit"/>
                            </p>
							<p><xsl:value-of select="//label[key='last_post']/value"/>: 
                                <xsl:value-of select="//user_get_profile/last_post"/></p>

								<label><xsl:value-of select="//label[key='posts']/value"/><br/>
                                <input type="text" name="num_posts" value="{//user_get_profile/num_posts}"/>
                                <br/>
                                </label>
							<label><xsl:value-of select="//label[key='admin_note']/value"/><br/>
							<input id="admin_note" type="text" name="admin_note" value="{//user_get_profile/admin_note}" size="30" maxlength="30"/><br/></label>
						</div>
					</fieldset>
				</div>
				<p><input type="submit" name="update" value="Submit"/></p>
			</form>
		</div>
	</div>
	<div class="clearer"></div>
</div>

</xsl:template>
</xsl:stylesheet>
