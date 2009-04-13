<!--
Program: PhunkyBB
Component: admin_users.xsl
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
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>
    <xsl:call-template name="jquery-setup">
      <xsl:with-param name="my-table">users_table</xsl:with-param>
      <xsl:with-param name="no-sort-column">,
				headers: {
					1: {sorter: false},
					2: {sorter: false}
				}
			</xsl:with-param>
    </xsl:call-template>
    <script type="text/javascript">
    function delete_user(user_id) {
      if (confirm('Are you sure?')){
        $.post("<xsl:value-of select="$link_prefix"/>x-user-delete&amp;user_id="+user_id,
          {'user_id': user_id},
          function (data){
            $("#u_"+user_id).remove();
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
          <xsl:value-of select="$my18n/users"/>
        </h2>
        <div class="box">
          <div style="min-height: 400px; padding: 1em;">
            <table class="tablesorter" id="users_table">
              <thead>
                <tr>
                  <th>
                    <xsl:value-of select="$my18n/users"/>
                  </th>
                  <th/>
                  <th/>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/_R_/users_get_all/users_get_all">
                  <tr id="u_{id}">
                    <td>
                      <a href="{$link_prefix}profile&amp;user_id={id}">
                        <xsl:value-of select="username"/>
                      </a>
                    </td>
                    <td>
                      <a href="{$link_prefix}profile&amp;user_id={id}">Edit</a>
                    </td>
                    <td>
                      <a href="{$link_prefix}x-user-delete&amp;user_id={id}"
                          onclick="delete_user({id}); return false;">
                          <xsl:value-of select="$my18n/delete"/>
                          </a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="pager">
            <xsl:with-param name="my-table">users_table</xsl:with-param>
          </xsl:call-template>
          <br/>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
