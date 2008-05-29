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
<xsl:include href="html_main.xsl"/>
<xsl:include href="admin_menu.xsl"/>
<xsl:template name="content">
<script type="text/javascript">
function category_delete(category_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>categories&amp;cat_to_delete="+category_id,
    {
        'cat_to_delete': category_id,
        'action': 'del_cat'
    },
    function (data){
    });
    }
}
</script>
<div id="adminconsole" class="block2col">
    <xsl:call-template name="admin-menu"/>
	<div class="blockform">
		<h2><xsl:value-of select="/_R_/i18n/label[key='add']/value"/> / <xsl:value-of select="/_R_/i18n/label[key='remove']/value"/>/<xsl:value-of select="/_R_/i18n/label[key='edit_categories']/value"/></h2>
		<div class="box">
            <form method="post">
			<div class="inform">
				<fieldset>
					<legend><xsl:value-of select="/_R_/i18n/label[key='add']/value"/>/<xsl:value-of select="/_R_/i18n/label[key='delete_categories']/value"/></legend>
					<div class="infldset">
						<table class="aligntop" cellspacing="0">
                            <input type="hidden" name="action" value="add_cat"/>
							<tr>
								<th scope="row"><xsl:value-of select="/_R_/i18n/label[key='add_a_new_category']/value"/><div>
                                <input type="submit" name="add_cat" value="Add New"/></div></th>
								<td>
									<input type="text" name="new_cat_name" size="35" maxlength="80"/>
									<span><xsl:value-of select="/_R_/i18n/label[key='name_of_new_category']/value"/> <a href="{//link_prefix}forums"><xsl:value-of select="/_R_/i18n/label[key='forums']/value"/></a> <xsl:value-of select="/_R_/i18n/label[key='to_add_forums']/value"/>.</span>

								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</div>
			<div class="inform">
				<fieldset>
					<legend><xsl:value-of select="/_R_/i18n/label[key='edit_categories']/value"/></legend>
					<div class="infldset">
						<table id="categoryedit" cellspacing="0" >
						<thead>
							<tr>
								<th class="tcl" scope="col"><xsl:value-of select="/_R_/i18n/label[key='name']/value"/></th>
								<th scope="col"><xsl:value-of select="/_R_/i18n/label[key='position']/value"/></th>
								<th>&#160;</th>
							</tr>
						</thead>
						<tbody>
                            <xsl:for-each select="//categories_get_all">
							<tr>
                            <td><input type="text" name="cat_name[0]" value="{cat_name}" size="35" maxlength="80"/></td>
                            <td><input type="text" name="cat_order[0]" value="0" size="3" maxlength="3"/></td>
                            <td>
                                <a href="{//link_prefix}categories&amp;action=del_cat&amp;category_id={cid}"
                                    onclick="category_delete({cid}); return false;">
                                    Delete
                                </a>
                            </td>
                            </tr>
                            </xsl:for-each>
                        </tbody>
						</table>
						<div class="fsetsubmit"><input type="submit" name="update" value="Update"/></div>
					</div>
				</fieldset>
			</div>
            </form>
		</div>

	</div>
</div>

</xsl:template>
</xsl:stylesheet>
