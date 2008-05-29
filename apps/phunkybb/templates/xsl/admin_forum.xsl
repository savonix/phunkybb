<!--
Program: PhunkyBB
Component: forum_admin.xsl
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
<xsl:include href="html_main.xsl"/>
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">

<script type="text/javascript">
function delete_forum(fid,cid) {
    var question = '<xsl:value-of select="/__ROOT__/i18n/labels/label[key='delete_confirm']/value"/>';
    if(confirm(question)) {
        $.post("<xsl:value-of select="//link_prefix"/>x-forum-delete&amp;id="+fid, {'id': fid},
        function (data){
        });
        myTable = document.getElementById("cat_table_"+cid);
        myTable.deleteRow("row_"+fid);
    }
}
</script>

<div id="adminconsole" class="block2col">
    <xsl:call-template name="admin-menu"/>
	<div class="blockform">
		<h2><xsl:value-of select="//label[key='add_forum']/value"/></h2>
		<div class="box">
			<form method="post" action="{//link_prefix}forums">
				<div class="inform">
					<fieldset>
						<legend><xsl:value-of select="//label[key='create_a_new_forum']/value"/></legend>

						<div class="infldset">
							<table class="aligntop" cellspacing="0">
								<tr>
									<th scope="row"><xsl:value-of select="//label[key='add_forum_to_category']/value"/><div><input type="submit" name="add_forum" value=" Add "/></div></th>
									<td>
                                    <input type="text" name="forum_name"/>
										<select name="add_to_cat">
                                        <xsl:for-each select="//categories_get_all">
										<option value="{cid}"><xsl:value-of select="cat_name"/></option>
                                        </xsl:for-each>
										</select>
										<xsl:value-of select="//label[key='select_a_category_to_add']/value"/>.
									</td>
								</tr>
							</table>
						</div>
					</fieldset>
				</div>
			</form>
		</div>

		<h2 class="block2"><span><xsl:value-of select="//label[key='edit_forums']/value"/></span></h2>
		<div class="box">
			<form id="edforum" method="post" action="{//link_prefix}forums">
				<p class="submittop"><input type="submit" name="update_positions" value="Update positions"/></p>
                <xsl:for-each select="//categories_get_all[cid=//forums_get_all/cid]">
                <xsl:variable name="my_cid"><xsl:value-of select="cid"/></xsl:variable>
				<div class="inform">
					<fieldset>
						<legend><xsl:value-of select="//label[key='category']/value"/>: <xsl:value-of select="cat_name"/></legend>
						<div class="infldset">

							<table cellspacing="0" id="cat_table_{cid}">
                            <xsl:for-each select="//forums_get_all[cid=$my_cid]">
								<tr id="row_{fid}">
									<th><a href="{//link_prefix}forum-edit"><xsl:value-of select="//label[key='edit']/value"/></a> - 
                                    <a href="{//link_prefix}forum-delete&amp;id={fid}" 
                                    onclick="delete_forum({fid},{cid}); return false;"><xsl:value-of select="//label[key='delete']/value"/></a></th>
									<td><xsl:value-of select="//label[key='position']/value"/><input type="text" name="position[3]" size="3" maxlength="3" value="0"/>
									&#160;<strong><xsl:value-of select="forum_name"/></strong></td>
								</tr>
                            </xsl:for-each>
							</table>

						</div>
					</fieldset>
				</div>
                </xsl:for-each>
				<p class="submitend"><input type="submit" name="update_positions" value="Update positions"/></p>
			</form>
		</div>
	</div>
</div>
</xsl:template>
</xsl:stylesheet>
