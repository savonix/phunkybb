<!--
Program: PhunkyBB
Component: admin_categories.xsl
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
  <xsl:include href="admin_menu.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>
		<script type="text/javascript">
		function category_delete(category_id) {
				if (confirm('Are you sure?')){
				$.post("<xsl:value-of select="$link_prefix"/>categories&amp;cat_to_delete="+category_id,
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
      <xsl:call-template name="admin-menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="my18n" select="$my18n"/>
      </xsl:call-template>

      <div class="blockform">
        <h2>
          <xsl:value-of select="$my18n/add"/>/
          <xsl:value-of select="$my18n/remove"/>/
          <xsl:value-of select="$my18n/edit_categories"/>
        </h2>
        <div class="box">
        <form method="post" class="inform">
                <xsl:value-of select="$my18n/add"/>/
                <xsl:value-of select="$my18n/delete_categories"/>
              <div class="infldset">
                <table class="aligntop" cellspacing="0">
                  <input type="hidden" name="action" value="add_cat"/>
                  <tr>
                    <th scope="row">
                      <xsl:value-of select="$my18n/add_a_new_category"/>
                      <div>
                        <input type="submit" name="add_cat" value="Add New"/>
                      </div>
                    </th>
                    <td>
                      <input type="text" name="new_cat_name" size="35"/>
                        <xsl:value-of select="$my18n/name_of_new_category"/>
                        <a href="{$link_prefix}forums">
                          <xsl:value-of select="$my18n/forums"/>
                        </a>
                        <xsl:value-of select="$my18n/to_add_forums"/>.
                    </td>
                  </tr>
                </table>
              </div>
							</form>
							<form method="post" class="inform">
							<input type="hidden" name="action" value="update_cats"/>
							<xsl:value-of select="$my18n/edit_categories"/>
              <div class="infldset">
                <table id="categoryedit" cellspacing="0">
                  <thead>
                    <tr>
                      <th class="tcl" scope="col">
                        <xsl:value-of select="$my18n/name"/>
                      </th>
                      <th scope="col">
                        <xsl:value-of select="$my18n/position"/>
                      </th>
                      <th>&#160;</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="/_R_/categories_get_all/categories_get_all">
											<input type="hidden" name="cid[]"
												value="{cid}" size="3" maxlength="3"/>
                      <tr>
                        <td>
                          <input type="text" name="cat_name[]"
	                          value="{cat_name}" size="35" maxlength="80"/>
                        </td>
                        <td>
                          <input type="text" name="disp_position[]"
                          	value="{disp_position}" size="3" maxlength="3"/>
                        </td>
                        <td>
                          <a href="{$link_prefix}categories&amp;action=del_cat&amp;category_id={cid}"
														onclick="category_delete({cid}); return false;">
														Delete
													</a>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
                <div class="fsetsubmit">
                  <input type="submit" name="update" value="Update"/>
                </div>
              </div>
        </form>
      </div>
    </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
