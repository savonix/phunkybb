<!--
Program: PhunkyBB
Component: admin_forum_edit.xsl
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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="admin_menu.xsl"/>
	<xsl:template name="content">
		<xsl:param name="link_prefix"/>
		<xsl:param name="my18n"/>

		<div id="adminconsole" class="block2col">
			<xsl:call-template name="admin-menu">
				<xsl:with-param name="link_prefix" select="$link_prefix"/>
				<xsl:with-param name="my18n" select="$my18n"/>
			</xsl:call-template>

			<div class="blockform">
				<h2 class="block2">
					<xsl:value-of select="$my18n/edit_forum"/>
				</h2>
				<div class="box">
					<form id="edforum" method="post" action="{$link_prefix}forum-edit">
					<input type="hidden" name="fid" value="{//_get/fid}"/>
					<input type="hidden" name="cat_id" value="{//forum_get_by_id/cat_id}"/>
						<p class="submittop">
							<input type="submit" name="update" value="Update"/>
						</p>

							<div class="inform">
								<fieldset>
									<legend>
										<xsl:value-of select="$my18n/forum"/>: <xsl:value-of select="//forum_get_by_id/forum_name"/>
									</legend>
									<div class="infldset">

										<table cellspacing="0" id="cat_table_{cid}">
												<tr id="row_{fid}">
													<td>
                            <input type="text" name="forum_name" id="forum_name" value="{//forum_get_by_id/forum_get_by_id/forum_name}" onkeyup="copyValue('forum_name','forum_basename')"/>
														<script type="text/javascript">
														function copyValue(field1,field2)
														{
															document.getElementById(field2).value=document.getElementById(field1).value.replace(/[ ]+/g,'_').replace(/[\W]+/g,'').toLowerCase();
														}
														</script>
														<input type="hidden" name="forum_basename"
														id="forum_basename"
														value="{//forum_get_by_id/forum_get_by_id/forum_basename}"/>
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<textarea name="forum_desc">
															<xsl:value-of select="//forum_get_by_id/forum_get_by_id/forum_desc"/>
														</textarea>
													</td>
												</tr>
										</table>

									</div>
								</fieldset>
							</div>
						<p class="submitend">
							<input type="submit" name="update_forum" value="Update"/>
						</p>
					</form>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
