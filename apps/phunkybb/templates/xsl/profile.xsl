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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="profile_menu.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>
		<div id="profile" class="block2col">
			<xsl:call-template name="profile-menu">
				<xsl:with-param name="link_prefix" select="$link_prefix"/>
				<xsl:with-param name="my18n" select="$my18n"/>
			</xsl:call-template>
			<!-- User Profile Nodeset -->
			<xsl:variable name="my_user" select="/_R_/user_get_profile/user_get_profile"/>

			<div class="blockform">
				<h2>
					<xsl:value-of select="$my_user/username"/> -
					<xsl:value-of select="$my18n/essentials"/>
				</h2>
				<div class="box">
					<form id="profile1" method="post">
						<xsl:if test="//_get/user_id and /_R_/runtime/group_id=1">
							<input type="hidden" name="user_id" value="{//_get/user_id}"/>
						</xsl:if>
						<xsl:if test="not(//_get/user_id) or not(/_R_/runtime/group_id=1)">
							<input type="hidden" name="user_id" value="{//runtime/user_id}"/>
						</xsl:if>
						<div class="inform">
							<fieldset>
								<legend>Enter your username and password</legend>
								<div class="infldset">
									<input type="hidden" name="old_username" value="demo"/>
									<label>
										<strong>
											<xsl:value-of select="$my18n/username"/>
										</strong>
										<br/>
										<input type="text" name="username"
												value="{$my_user/username}"/>
										<br/>
									</label>
									<p>
										<a href="{$link_prefix}password">Change password</a>
									</p>
								</div>
							</fieldset>
						</div>
						<div class="inform">
							<fieldset>
								<legend>Enter a valid e-mail address</legend>
								<div class="infldset">
									<label>
										<strong>
											<xsl:value-of select="$my18n/email"/>
										</strong>
										<br/>
										<input type="text" name="email" value="{$my_user/email}"/>
										<br/>
									</label>
									<xsl:if test="/_R_/runtime/group_id=1">
										<a href="{$link_prefix}user-email&amp;user_id={//_get/user_id}">
                  Email user
                </a>
									</xsl:if>
								</div>
							</fieldset>
						</div>
						<div class="inform">
							<fieldset>
								<legend>
									<xsl:value-of select="$my18n/user_activity"/>
								</legend>
								<div class="infldset">
									<xsl:if test="/_R_/runtime/group_id=1">
										<p>
											<xsl:value-of select="$my18n/registration_ip"/>:
											<a href="http://www.arin.net/?queryinput={$my_user/r/registration_ip}"
												target="_blank">
												<xsl:value-of select="$my_user/r/registration_ip"/>
											</a>
										</p>
									</xsl:if>
									<p>
										<xsl:value-of select="$my18n/registered"/>:
										<xsl:value-of select="$my_user/registered"/>
									</p>
									<p>
										<xsl:value-of select="$my18n/last_visit"/>:
                <xsl:value-of select="$my_user/last_visit"/>
									</p>
									<p>
										<xsl:value-of select="$my18n/last_post"/>:
										<xsl:value-of select="$my_user/last_post"/>
									</p>
									<label>
										<xsl:value-of select="$my18n/posts"/>
										<br/>
										<input type="text" name="num_posts"
											value="{$my_user/num_posts}"/>
										<br/>
									</label>
									<label>
										<xsl:value-of select="$my18n/admin_note"/>
										<br/>
										<input id="admin_note" type="text" name="admin_note"
											value="{$my_user/admin_note}"/>
										<br/>
									</label>
								</div>
							</fieldset>
						</div>
						<p>
							<input type="submit" name="update" value="Submit"/>
						</p>
					</form>
				</div>
			</div>
		</div>

	</xsl:template>
</xsl:stylesheet>
