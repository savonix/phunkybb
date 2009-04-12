<!--
Program: PhunkyBB
Component: admin_forum.xsl
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

    <script type="text/javascript">
    function delete_forum(fid) {
        var question = '<xsl:value-of select="$my18n/delete_confirm"/>';
        if(confirm(question)) {
            $.post("<xsl:value-of select="$link_prefix"/>x-forum-delete&amp;id="+fid, {'id': fid},
            function (data){
	            $("#f_"+fid).remove();
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
          <xsl:value-of select="$my18n/add_forum"/>
        </h2>
        <div class="box">
          <form method="post" action="{$link_prefix}admin-forums">
					<input type="hidden" name="site_id" value="{//runtime/site_id}"/>
            <div class="inform">
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/add_forum"/>
                </legend>
                <div class="infldset">
                  <table class="aligntop" cellspacing="0">
                    <tr>
                      <th scope="row">
                        <xsl:value-of select="$my18n/add_forum_to_category"/>
                        <div>
                          <input type="submit" name="add_forum" value=" Add "/>
                        </div>
                      </th>
                      <td>
												<input type="text" name="forum_name" id="forum_name" onkeyup="copyValue('forum_name','forum_basename')"/>
												<script type="text/javascript">
												function copyValue(field1,field2)
												{
													document.getElementById(field2).value=document.getElementById(field1).value.replace(/[ ]+/g,'_').replace(/[\W]+/g,'').toLowerCase();
												}
												</script>
												<input type="hidden" name="forum_basename" id="forum_basename" value="{//forum_get_by_id/forum_get_by_id/forum_basename}"/>
												<br/>
                        <select name="add_to_cat">
                          <xsl:for-each select="/_R_/categories_get_all/categories_get_all">
                            <option value="{cid}">
                              <xsl:value-of select="cat_name"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <xsl:value-of select="$my18n/select_a_category_to_add"/>.
                      </td>
                    </tr>
                  </table>
                </div>
              </fieldset>
            </div>
          </form>
        </div>

        <h2 class="block2">
          <span>
            <xsl:value-of select="$my18n/edit_forums"/>
          </span>
        </h2>
        <div class="box">
          <form id="edforum" method="post" action="{$link_prefix}forums">
            <p class="submittop">
              <input type="submit" name="update_positions" value="Update positions"/>
            </p>
            <xsl:for-each select="/_R_/categories_get_all/categories_get_all[cid=/_R_/forums_get_all/forums_get_all/cid]">
              <xsl:variable name="my_cid" select="cid"/>
              <div class="inform">
                <fieldset>
                  <legend>
                    <xsl:value-of select="$my18n/category"/>:
                    <xsl:value-of select="cat_name"/>
                  </legend>
                  <div class="infldset">
                    <table cellspacing="0" id="cat_table_{cid}">
                      <xsl:for-each select="/_R_/forums_get_all/forums_get_all[cid=$my_cid]">
                        <tr id="f_{fid}">
                          <th>
                            <a href="{$link_prefix}forum-edit&amp;fid={fid}">
                              <xsl:value-of select="$my18n/edit"/>
                            </a> - 
                            <a href="{$link_prefix}forum-delete&amp;id={fid}"
                              onclick="delete_forum({fid},{cid}); return false;">
                              <xsl:value-of select="$my18n/delete"/>
                            </a>
                          </th>
                          <td>
                            <xsl:value-of select="$my18n/position"/>
                            <input type="hidden" name="fid[]" size="3" value="{fid}"/>
                            <input type="text" name="disp_position[]" size="3" value="{disp_position}"/>
                            &#160;<strong><xsl:value-of select="forum_name"/>
                            </strong>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </table>
                  </div>
                </fieldset>
              </div>
            </xsl:for-each>
            <p class="submitend">
              <input type="submit"
                name="update_positions" value="Update positions"/>
            </p>
          </form>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
