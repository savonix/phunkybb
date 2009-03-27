<!--
Program: PhunkyBB
Component: admin_sites.xsl
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
				<h2>Sites</h2>
				<div class="box">
					<form method="post" class="inform">
					This page is for the new capability to host multiple sites in a single database.
          <div style="min-height: 400px; padding: 1em;">
            <table class="tablesorter" id="users_table">
              <thead>
                <tr>
                  <th>
                    <xsl:value-of select="$my18n/sites"/>
                  </th>
                  <th></th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="/_R_/sites_get_all/sites_get_all">
                  <tr>
                    <td>
                      <a href="{$link_prefix}site-edit&amp;site_id={site_id}">
                        <xsl:value-of select="http_host"/>
                      </a>
                    </td>
                    <td>
                      <a href="{$link_prefix}site-edit&amp;site_id={site_id}">Edit</a>
                    </td>
                    <td>
                      <a href="{$link_prefix}x-site-edit&amp;site_id={site_id}"
                        onclick="delete_site({site_id}); return false;">Delete</a>
                    </td>
                  </tr>
                </xsl:for-each>
						</tbody>
						</table>
						</div>
					</form>
          <a href="{$link_prefix}site-edit">New</a>
				</div>
			</div>
		</div>

		<div class="block" style="clear: both;">
		</div>
	</xsl:template>
</xsl:stylesheet>
