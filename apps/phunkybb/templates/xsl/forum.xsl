<!--
Program: PhunkyBB
Component: forum.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="html_main.xsl"/>

<xsl:template name="content">
<xsl:param name="link_prefix"/>
<xsl:param name="my18n"/>

<div class="linkst">
	<div class="inbox">
		<!--
    <p class="pagelink conl">
      <xsl:value-of select="$my18n/pages"/>:
      <strong>
        <xsl:value-of select="/_R_/forum_get_number_of_pages/forum_get_number_of_pages/pages"/>
      </strong>
    </p>
		-->
    <xsl:if test="/_R_/runtime/username">
      <p class="postlink conr">
        <a href="{$link_prefix}post&amp;fid={/_R_/_get/fid}">
          <xsl:value-of select="$my18n/post_topic"/>
        </a>
      </p>
    </xsl:if>
    <ul class="breadcrumbs">
      <li>
        <a href="{$link_prefix}index">
          <xsl:value-of select="$my18n/index"/>
        </a>&#160;
      </li>
      <li>
        &gt; &#160;
        <a href="{$link_prefix}forum&amp;fid={/_R_/_get/fid}">
          <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
        </a>
      </li>
    </ul>
	</div>
</div>
<div id="vf" class="blocktable">
	<h2>
    <span>
      <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
    </span>
  </h2>
	<div class="box">
		<div class="inbox">
			<table cellspacing="0">
        <thead>
          <tr>
            <th class="tcl" scope="col">
              <xsl:value-of select="$my18n/topic"/>
            </th>
            <th class="tc2" scope="col">
              <xsl:value-of select="$my18n/replies"/>
            </th>
            <th class="tcr" scope="col">
              <xsl:value-of select="$my18n/last_post"/>
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/_R_/topics_get_by_forum_id/topics_get_by_forum_id">
            <tr>
              <td class="tcl">
                <div class="intd">
                  <xsl:if test="not(/_R_/runtime/last_visit_timestamp &lt;
                    last_post_timestamp)">
                    <div class="icon"><div class="nosize"></div></div>
                  </xsl:if>
                  <xsl:if test="/_R_/runtime/last_visit_timestamp &lt;
                    last_post_timestamp">
                    <div class="icon inew"><div class="nosize"></div></div>
                  </xsl:if>
                  <div class="tclcon">
										<!-- Need to use the link_builder here! -->
										<xsl:if test="//mod_rewrite='true'">
                    <a>
											<xsl:attribute name="href">
												<xsl:value-of select="//path_prefix"/>
												<xsl:value-of select="//_get/forum_basename"/>
												<xsl:text>/</xsl:text>
												<xsl:value-of select="basename"/>
												<xsl:text>/</xsl:text>
											</xsl:attribute>
                      <xsl:value-of select="subject"/>
                    </a>
										</xsl:if>
										<xsl:if test="not(//mod_rewrite='true')">
                    <a href="{$link_prefix}topic&amp;basename={basename}&amp;fid={/_R_/_get/fid}&amp;id={id}">
                      <xsl:value-of select="subject"/>
                    </a>
										</xsl:if>
                  </div>
                </div>
              </td>
              <td class="tc2">
                <xsl:value-of select="num_replies"/>
              </td>
              <td class="tcr">
							<span class="date">
              <xsl:if test="not(last_post='1969-12-31 20:00:00')">
                <xsl:value-of select="last_post"/>
              </xsl:if>
              <xsl:if test="not(/_R_/runtime/user_id &gt; 0)">
                UTC
              </xsl:if>
							</span>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(/_R_/topics_get_by_forum_id)">
            <tr>
              <td class="tcl" colspan="3">
                <xsl:value-of select="$my18n/forum_is_empty"/>.
              </td>
            </tr>
          </xsl:if>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div class="linkst">
  <div class="inbox">
		<!--
    <p class="pagelink conl">
      <xsl:value-of select="$my18n/pages"/>:
      <strong></strong>
    </p>
		-->
    <xsl:if test="/_R_/runtime/username">
      <p class="postlink conr">
        <a href="{$link_prefix}post&amp;fid={/_R_/_get/fid}">
          <xsl:value-of select="$my18n/post_new_topic"/>
        </a>
      </p>
    </xsl:if>
    <ul class="breadcrumbs">
      <li>
        <a href="{$link_prefix}index">
          <xsl:value-of select="$my18n/index"/>
        </a>&#160;
      </li>
      <li>
        &gt; &#160;
        <a href="{$link_prefix}forum&amp;fid={/_R_/_get/fid}">
          <xsl:value-of select="/_R_/forum_get_by_id/forum_get_by_id/forum_name"/>
        </a>
      </li>
    </ul>
  </div>
</div>
</xsl:template>
</xsl:stylesheet>
