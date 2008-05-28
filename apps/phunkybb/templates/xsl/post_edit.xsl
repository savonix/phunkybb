<!--
Program: PhunkyBB
Component: post_edit.xsl
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
<xsl:template name="content">
<xsl:param name="link_prefix"/>
<div class="blockform">
<h2><xsl:value-of select="//label[key='edit_post']/value"/></h2>
<div class="box">
    <form id="post" method="post" action="{$link_prefix}topic-submit">
        <input type="hidden" name="post_id" value="{//_get/post_id}"/>
        <div class="inform">
            <fieldset>
                <legend><xsl:value-of select="//label[key='write_your_message']/value"/></legend>
                <div class="infldset txtarea">
                    <label><strong><xsl:value-of select="//label[key='message']/value"/></strong><br/>
                    <textarea name="message" rows="20" cols="95"><xsl:value-of select="//post_get_by_id/message"/></textarea><br/></label>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend><xsl:value-of select="//label[key='options']/value"/></legend>
                <div class="infldset">
                    <div class="rbox">
                    <label>
                    <input type="checkbox" name="subscribe" value="1"/>
                    <xsl:value-of select="//label[key='subscribe']/value"/><br/>
                    </label>
                    </div>
                </div>
            </fieldset>
        </div>
        <p>
            <input type="submit" name="submit" value="Submit"/>
            <input type="submit" name="preview" value="Preview"/>
            <a href="{$link_prefix}" onclick="history.go(-1);">
                <xsl:value-of select="//label[key='go_back']/value"/>
            </a>
        </p>
    </form>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
