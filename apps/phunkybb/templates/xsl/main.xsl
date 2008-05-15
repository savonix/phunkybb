<!--
Program: PhunkyBB
Component: main.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="html_shell.xsl"/>
<xsl:template name="main">
<div id="punwrap">
<div id="" class="pun">

<div id="brdheader" class="block">
	<div class="box">
		<div id="brdtitle" class="inbox">
        <h1><span><xsl:value-of select="//o_board_title"/></span></h1>
		<p><span><xsl:value-of select="//o_board_desc"/></span></p>
		</div>
		<div id="brdmenu" class="inbox">
            <xsl:for-each select="//navlinks">
            </xsl:for-each>
            <a href="{//link_prefix}welcome">
                <xsl:value-of select="//label[key='index']/value"/>
            </a>

            <xsl:if test="not(//runtime/username)">
            <a href="{//link_prefix}register"><xsl:value-of select="//label[key='register']/value"/></a>
            <a href="{//link_prefix}login"><xsl:value-of select="//label[key='login']/value"/></a>
            </xsl:if>

            <xsl:if test="//runtime/group_id='1'">
            <a href="{//link_prefix}admin"><xsl:value-of select="//label[key='administration']/value"/></a>
            </xsl:if>
            <xsl:if test="//runtime/username">
            <a href="{//link_prefix}profile">Profile</a>
            <a href="{//link_prefix}logout">Logout</a>
            </xsl:if>
        </div>
		<div id="brdwelcome" class="inbox">
            <xsl:if test="not(//runtime/username)">
			<p>You are not logged in.</p>
            </xsl:if>
            <xsl:if test="//runtime/username">
            Logged in as <b><xsl:value-of select="//runtime/username"/></b>
            </xsl:if>
		</div>
	</div>
</div>

<div id="" class="blocktable">
    <xsl:call-template name="content"/>
</div>

<div id="brdfooter" class="block">
	<h2><span>Board footer</span></h2>
	<div class="box">
		<div class="inbox">
			<dl id="searchlinks" class="conl">
			</dl>
			<p class="conr">Powered by <a href="http://www.phunkybb.docunext.com/blog/">PhunkyBB</a>, a fork of punbb.
            <xsl:if test="//runtime/svn_revision">
                Revision <xsl:value-of select="//runtime/svn_revision"/>
            </xsl:if>
            </p>
			<div class="clearer"></div>
		</div>
	</div>
</div>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
