<!--
Program: PhunkyBB
Component: admin_options.xsl
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
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">
<div id="adminconsole" class="block2col">
    <xsl:call-template name="admin-menu"/>

	<div class="blockform">
		<h2><span>Options</span></h2>
		<div class="box">
			<form method="post">
				<p class="submittop"><input type="submit" name="save" value="Save Changes" /></p>
				<div class="inform">
				<input type="hidden" name="form_sent" value="" />
					<fieldset>

						<legend>Essentials</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Board title</th>
									<td>
										<input type="text" name="form[board_title]" size="50" maxlength="255" value="" />
										<span>The title of this bulletin board (shown at the top of every page). This field may <strong>not</strong> contain HTML.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Board description</th>
									<td>
										<input type="text" name="form[board_desc]" size="50" maxlength="255" value="" />
										<span>A short description of this bulletin board (shown at the top of every page). This field may contain HTML.</span>
									</td>

								</tr>
								<tr>
									<th scope="row">Base URL</th>
									<td>
										<input type="text" name="form[base_url]" size="50" maxlength="100" value="" />
										<span>The complete URL of the forum without trailing slash (i.e. http://www.mydomain.com/forums). This <strong>must</strong> be correct in order for all admin and moderator features to work. If you get "Bad referer" errors, it's probably incorrect.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Server timezone</th>
									<td>
										<select name="form[server_timezone]">
											<option value="-12">-12</option>
											<option value="-11">-11</option>

											<option value="-10">-10</option>
											<option value="-9.5">-09.5</option>
											<option value="-9">-09</option>
											<option value="-8.5">-08.5</option>
											<option value="-8">-08 PST</option>
											<option value="-7">-07 MST</option>

											<option value="-6">-06 CST</option>
											<option value="-5">-05 EST</option>
											<option value="-4">-04 AST</option>
											<option value="-3.5">-03.5</option>
											<option value="-3">-03 ADT</option>
											<option value="-2">-02</option>

											<option value="-1">-01</option>
											<option value="0" selected="selected">00 GMT</option>
											<option value="1">+01 CET</option>
											<option value="2">+02</option>
											<option value="3">+03</option>
											<option value="3.5">+03.5</option>

											<option value="4">+04</option>
											<option value="4.5">+04.5</option>
											<option value="5">+05</option>
											<option value="5.5">+05.5</option>
											<option value="6">+06</option>
											<option value="6.5">+06.5</option>

											<option value="7">+07</option>
											<option value="8">+08</option>
											<option value="9">+09</option>
											<option value="9.5">+09.5</option>
											<option value="10">+10</option>
											<option value="10.5">+10.5</option>

											<option value="11">+11</option>
											<option value="11.5">+11.5</option>
											<option value="12">+12</option>
											<option value="13">+13</option>
										</select>
										<span>The timezone of the server where PunBB is installed.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Default language</th>
									<td>
										<select name="form[default_lang]">
											<option value="English" selected="selected">English</option>
										</select>

										<span>This is the default language style used if the visitor is a guest or a user that hasn't changed from the default in his/her profile. If you remove a language pack, this must be updated.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Default style</th>
									<td>
										<select name="form[default_style]">
									<option value="Cobalt">Cobalt</option>

									<option value="Lithium">Lithium</option>
									<option value="Mercury">Mercury</option>
									<option value="Oxygen" selected="selected">Oxygen</option>
									<option value="Radium">Radium</option>
									<option value="Sulfur">Sulfur</option>
										</select>

										<span>This is the default style used for guests and users who haven't changed from the default in their profile.</span></td>
								</tr>
							</table>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>

						<legend>Time and timeouts</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Time format</th>
									<td>
										<input type="text" name="form[time_format]" size="25" maxlength="25" value="" />
										<span>[Current format: 12:11:16]See <a href="http://www.php.net/manual/en/function.date.php">here</a> for formatting options.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Date format</th>
									<td>
										<input type="text" name="form[date_format]" size="25" maxlength="25" value="" />
										<span>[Current format: 2008-03-01]See <a href="http://www.php.net/manual/en/function.date.php">here</a> for formatting options.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Visit timeout</th>
									<td>
										<input type="text" name="form[timeout_visit]" size="5" maxlength="5" value="" />
										<span>Number of seconds a user must be idle before his/hers last visit data is updated (primarily affects new message indicators).</span>
									</td>

								</tr>
								<tr>
									<th scope="row">Online timeout</th>
									<td>
										<input type="text" name="form[timeout_online]" size="5" maxlength="5" value="" />
										<span>Number of seconds a user must be idle before being removed from the online users list.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Redirect time</th>
									<td>
										<input type="text" name="form[redirect_delay]" size="3" maxlength="3" value="" />
										<span>Number of seconds to wait when redirecting. If set to 0, no redirect page will be displayed (not recommended).</span>
									</td>
								</tr>
							</table>

						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Display</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">

								<tr>
									<th scope="row">Version number</th>
									<td>
										<input type="radio" name="form[show_version]" value="" /><strong>No</strong>
										<span>Show version number in footer.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">User info in posts</th>
									<td>
										<input type="radio" name="form[show_user_info]" value="" /><strong>No</strong>
										<span>Show information about the poster under the username in topic view. The information affected is location, register date, post count and the contact links (e-mail and URL).</span>
									</td>
								</tr>

								<tr>
									<th scope="row">User post count</th>
									<td>
										<input type="radio" name="form[show_post_count]" value="" /><strong>No</strong>
										<span>Show the number of posts a user has made (affects topic view, profile and userlist).</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Smilies</th>
									<td>
										<input type="radio" name="form[smilies]" value="" /><strong>No</strong>
										<span>Convert smilies to small icons.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Smilies in signatures</th>
									<td>
										<input type="radio" name="form[smilies_sig]" value="" /><strong>No</strong>
										<span>Convert smilies to small icons in user signatures.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Make clickable links</th>
									<td>
										<input type="radio" name="form[make_links]" value="" /><strong>No</strong>
										<span>When enabled, PunBB will automatically detect any URL's in posts and make them clickable hyperlinks.</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Topic review</th>
									<td>
										<input type="text" name="form[topic_review]" size="3" maxlength="3" value="" />
										<span>Maximum number of posts to display when posting (newest first). 0 to disable.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">Topics per page default</th>
									<td>
										<input type="text" name="form[disp_topics_default]" size="3" maxlength="3" value="" />
										<span>The default number of topics to display per page in a forum. Users can personalize this setting.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Posts per page default</th>

									<td>
										<input type="text" name="form[disp_posts_default]" size="3" maxlength="3" value="" />
										<span>The default number of posts to display per page in a topic. Users can personalize this setting.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Indent size</th>
									<td>

										<input type="text" name="form[indent_num_spaces]" size="3" maxlength="3" value="" />
										<span>If set to 8, a regular tab will be used when displaying text within the [code][/code] tag. Otherwise this many spaces will be used to indent the text.</span>
									</td>
								</tr>
							</table>
						</div>
					</fieldset>
				</div>

				<div class="inform">
					<fieldset>
						<legend>Features</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Quick post</th>
									<td>

										<input type="radio" name="form[quickpost]" value="" /><strong>No</strong>
										<span>When enabled, PunBB will add a quick post form at the bottom of topics. This way users can post directly from the topic view.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Users online</th>
									<td>

										<input type="radio" name="form[users_online]" value="" /><strong>No</strong>
										<span>Display info on the index page about guests and registered users currently browsing the forums.</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><a name="censoring">Censor words</a></th>
									<td>

										<input type="radio" name="form[censoring]" value="" /><strong>No</strong>
										<span>Enable this to censor specific words in the forum. See <a href="admin_censoring.php">Censoring</a> for more info.</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><a name="ranks">User ranks</a></th>

									<td>
										<input type="radio" name="form[ranks]" value="" /><strong>No</strong>
										<span>Enable this to use user ranks. See <a href="admin_ranks.php">Ranks</a> for more info.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">User has posted earlier</th>
									<td>
										<input type="radio" name="form[show_dot]" value="" /><strong>No</strong>
										<span>This feature displays a dot in front of topics in viewforum.php in case the currently logged in user has posted in that topic earlier. Disable if you are experiencing high server load.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">Quick jump</th>
									<td>
										<input type="radio" name="form[quickjump]" value="" /><strong>No</strong>
										<span>Enable the quick jump (jump to forum) drop list.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">GZip output</th>
									<td>
										<input type="radio" name="form[gzip]" value="" /><strong>No</strong>
										<span>If enabled, PunBB will gzip the output sent to browsers. This will reduce bandwidth usage, but use a little more CPU. This feature requires that PHP is configured with zlib (--with-zlib). Note: If you already have one of the Apache modules mod_gzip or mod_deflate set up to compress PHP scripts, you should disable this feature.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">Search all forums</th>
									<td>
										<input type="radio" name="form[search_all_forums]" value="" /><strong>No</strong>
										<span>When disabled, searches will only be allowed in one forum at a time. Disable if server load is high due to excessive searching.</span>
									</td>
								</tr>
								<tr>

									<th scope="row">Additional menu items</th>
									<td>
										<textarea name="form[additional_navlinks]" rows="3" cols="55"></textarea>
										<span>By entering HTML hyperlinks into this textbox, any number of items can be added to the navigation menu at the top of all pages. The format for adding new links is X = &lt;a href="URL"&gt;LINK&lt;/a&gt; where X is the position at which the link should be inserted (e.g. 0 to insert at the beginning and 2 to insert after "User list"). Separate entries with a linebreak.</span>
									</td>

								</tr>
							</table>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Reports</legend>

						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Report method</th>
									<td>
										<input type="radio" name="form[report_method]" value="" />Both
										<span>Select the method for handling topic/post reports. You can choose whether topic/post reports should be handled by the internal report system,  e-mailed to the addresses on the mailing list (see below) or both.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Report new registrations</th>
									<td>
										<input type="radio" name="form[regs_report]" value="" /><strong>No</strong>
										<span>If enabled, PunBB will notify users on the mailing list (see below) when a new user registers in the forums.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Mailing list</th>
									<td>
										<textarea name="form[mailing_list]" rows="5" cols="55">support@savonix.com</textarea>
										<span>A comma separated list of subscribers. The people on this list are the recipients of reports.</span>

									</td>
								</tr>
							</table>
						</div>
					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>Avatars</legend>

						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Use avatars</th>
									<td>
										<input type="radio" name="form[avatars]" value="" /><strong>No</strong>
										<span>When enabled, users will be able to upload an avatar which will be displayed under their title/rank.</span>

									</td>
								</tr>
								<tr>
									<th scope="row">Upload directory</th>
									<td>
										<input type="text" name="form[avatars_dir]" size="35" maxlength="50" value="" />
										<span>The upload directory for avatars (relative to the PunBB root directory). PHP must have write permissions to this directory.</span>
									</td>

								</tr>
								<tr>
									<th scope="row">Max width</th>
									<td>
										<input type="text" name="form[avatars_width]" size="5" maxlength="5" value="" />
										<span>The maximum allowed width of avatars in pixels (60 is recommended).</span>
									</td>
								</tr>

								<tr>
									<th scope="row">Max height</th>
									<td>
										<input type="text" name="form[avatars_height]" size="5" maxlength="5" value="" />
										<span>The maximum allowed height of avatars in pixels (60 is recommended).</span>
									</td>
								</tr>
								<tr>

									<th scope="row">Max size</th>
									<td>
										<input type="text" name="form[avatars_size]" size="6" maxlength="6" value="" />
										<span>The maximum allowed size of avatars in bytes (10240 is recommended).</span>
									</td>
								</tr>
							</table>
						</div>

					</fieldset>
				</div>
				<div class="inform">
					<fieldset>
						<legend>E-mail</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>

									<th scope="row">Admin e-mail</th>
									<td>
										<input type="text" name="form[admin_email]" size="50" maxlength="50" value="" />
										<span>The e-mail address of the forum administrator.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Webmaster e-mail</th>

									<td>
										<input type="text" name="form[webmaster_email]" size="50" maxlength="50" value="" />
										<span>This is the address that all e-mails sent by the forum will be addressed from.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Subscriptions</th>
									<td>

										<input type="radio" name="form[subscriptions]" value="" /><strong>No</strong>
										<span>Enable users to subscribe to topics (recieve e-mail when someone replies).</span>
									</td>
								</tr>
								<tr>
									<th scope="row">SMTP server address</th>
									<td>

										<input type="text" name="form[smtp_host]" size="30" maxlength="100" value="" />
										<span>The address of an external SMTP server to send e-mails with. You can specify a custom port number if the SMTP server doesn't run on the default port 25 (example: mail.myhost.com:3580). Leave blank to use the local mail program.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">SMTP username</th>
									<td>
										<input type="text" name="form[smtp_user]" size="25" maxlength="50" value="" />

										<span>Username for SMTP server. Only enter a username if it is required by the SMTP server (most servers <strong>do not</strong> require authentication).</span>
									</td>
								</tr>
								<tr>
									<th scope="row">SMTP password</th>
									<td>

										<input type="text" name="form[smtp_pass]" size="25" maxlength="50" value="" />
										<span>Password for SMTP server. Only enter a password if it is required by the SMTP server (most servers <strong>do not</strong> require authentication).</span>
									</td>
								</tr>
							</table>
						</div>
					</fieldset>

				</div>
				<div class="inform">
					<fieldset>
						<legend>Registration</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Allow new registrations</th>

									<td>
										<input type="radio" name="form[regs_allow]" value="" /><strong>No</strong>
										<span>Controls whether this forum accepts new registrations. Disable only under special circumstances.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Verify registrations</th>

									<td>
										<input type="radio" name="form[regs_verify]" value="" /><strong>No</strong>
										<span>When enabled, users are e-mailed a random password when they register. They can then log in and change the password in their profile if they see fit. This feature also requires users to verify new e-mail addresses if they choose to change from the one they registered with. This is an effective way of avoiding registration abuse and making sure that all users have "correct" e-mail addresses in their profiles.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Use forum rules</th>

									<td>
										<input type="radio" name="form[rules]" value="" /><strong>No</strong>
										<span>When enabled, users must agree to a set of rules when registering (enter text below). The rules will always be available through a link in the navigation table at the top of every page.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Rules</th>

									<td>
										<textarea name="form[rules_message]" rows="10" cols="55">Enter your rules here.</textarea>
										<span>Here you can enter any rules or other information that the user must review and accept when registering. If you enabled rules above you have to enter something here, otherwise it will be disabled. This text will not be parsed like regular posts and thus may contain HTML.</span>
									</td>
								</tr>
							</table>
						</div>
					</fieldset>

				</div>
				<div class="inform">
					<fieldset>
						<legend>Announcement</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row">Display announcement</th>

									<td>
										<input type="radio" name="form[announcement]" value="" /><strong>No</strong>
										<span>Enable this to display the below message in the forums.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Announcement message</th>

									<td>
										<textarea name="form[announcement_message]" rows="5" cols="55">Enter your announcement here.</textarea>
										<span>This text will not be parsed like regular posts and thus may contain HTML.</span>
									</td>
								</tr>
							</table>
						</div>
					</fieldset>

				</div>
				<div class="inform">
					<fieldset>
						<legend>Maintenance</legend>
						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row"><a name="maintenance">Maintenance mode</a></th>

									<td>
										<input type="radio" name="form[maintenance]" value="" /><strong>No</strong>
										<span>When enabled, the board will only be available to administrators. This should be used if the board needs to taken down temporarily for maintenance. WARNING! Do not log out when the board is in maintenance mode. You will not be able to login again.</span>
									</td>
								</tr>
								<tr>
									<th scope="row">Maintenance message</th>

									<td>
										<textarea name="form[maintenance_message]" rows="5" cols="55">The forums are temporarily down for maintenance. Please try again in a few minutes.&lt;br /&gt;\n&lt;br /&gt;\n/Administrator</textarea>
										<span>The message that will be displayed to users when the board is in maintenance mode. If left blank a default message will be used. This text will not be parsed like regular posts and thus may contain HTML.</span>
									</td>
								</tr>
							</table>
						</div>
					</fieldset>

				</div>
				<p class="submitend"><input type="submit" name="save" value="Save Changes" /></p>
			</form>
		</div>
	</div>
	<div class="clearer"></div>
</div>

</xsl:template>
</xsl:stylesheet>
