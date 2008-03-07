<!--
Program: PhunkyBB
Component: admin.xsl
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
		<h2><span>Add/remove/edit categories</span></h2>
		<div class="box">
			<div class="inform">
				<fieldset>
					<legend>Add/delete categories</legend>
					<div class="infldset">
						<table class="aligntop" cellspacing="0">
                            <form method="post" action="{//link_prefix}categories&amp;view_flow=true">
                            <input type="hidden" name="action" value="add_cat"/>
							<tr>
								<th scope="row">Add a new category<div>
                                <input type="submit" name="add_cat" value="Add New" tabindex="2" /></div></th>
								<td>
									<input type="text" name="new_cat_name" size="35" maxlength="80" tabindex="1" />
									<span>The name of the new category you want to add. You can edit the name of the category later (see below). Go to <a href="{//link_prefix}forums">Forums</a> to add forums to your new category.</span>

								</td>
							</tr>
                            </form>
                            <form method="post" action="{//link_prefix}categories&amp;view_flow=true">
                            <input type="hidden" name="action" value="del_cat"/>
							<tr>
								<th scope="row">Delete a category<div>
                                <input type="submit" name="del_cat" value="Delete" tabindex="4" /></div></th>
								<td>
									<select name="cat_to_delete" tabindex="3">
                                        <xsl:for-each select="//categories_get_all">
										<option value="{cid}"><xsl:value-of select="cat_name"/></option>
                                        </xsl:for-each>
									</select>
									<span>Select the name of the category you want to delete. You will be asked to confirm your choice of category for deletion before it is deleted.</span>
								</td>
							</tr>
                            </form>
						</table>
					</div>
				</fieldset>

			</div>
			<div class="inform">
				<fieldset>
					<legend>Edit categories</legend>
					<div class="infldset">
						<table id="categoryedit" cellspacing="0" >
						<thead>
							<tr>

								<th class="tcl" scope="col">Name</th>
								<th scope="col">Position</th>
								<th>&#160;</th>
							</tr>
						</thead>
						<tbody>
                            <xsl:for-each select="//categories_get_all">
							<tr><td><input type="text" name="cat_name[0]" value="{cat_name}" size="35" maxlength="80" /></td>
                            <td><input type="text" name="cat_order[0]" value="0" size="3" maxlength="3" /></td>
                            <td></td></tr>
                            </xsl:for-each>
                        </tbody>
						</table>
						<div class="fsetsubmit"><input type="submit" name="update" value="Update" /></div>
					</div>
				</fieldset>
			</div>
		</div>

	</div>
	<div class="clearer"></div>
</div>

</xsl:template>
</xsl:stylesheet>