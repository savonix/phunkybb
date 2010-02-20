<!--
Program: http://www.docunext.com
Component: html_custom.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">


<xsl:template name="page">
  <html>
    <xsl:call-template name="head"/>
    <body class="rounded">
    <div id="doc3" class="yui-t6">
      <div id="hd">
        <img src="/s/img/docunext.png" alt="" style="float:right;"/>
        <h1>Not A Sinatra App</h1>
        <xsl:call-template name="nav-menu"/>
      </div>
      <div id="bd">
        <div id="yui-main">
          <div class="yui-b"><div class="yui-g">
            <div id="page-content">
            <xsl:if test="$RACK_ENV='demo'">
              <xsl:call-template name="ads"/>
            </xsl:if>
            <xsl:apply-templates />
            </div>
          </div></div>
        </div>
        <div id="sidebar" class="yui-b">
          <xsl:if test="$RACK_ENV='demo'">
            <xsl:call-template name="ads"/>
          </xsl:if>
          <xsl:call-template name="sidebar"/>
        </div>
      </div>
      <xsl:call-template name="footer"/>
    </div>
    <xsl:if test="$RACK_ENV='demo'">
      <!--<xsl:call-template name="analytics_code"/>-->
    </xsl:if>
    </body>
  </html>
</xsl:template>


<xsl:template name="nav-menu">
<div id="navigation">
<ul id="primary-navigation">
  <li id="nav-home"><a href="/">Home</a></li>
</ul>
<ul id="user-navigation">
  <li><a href="/runtime/info" class="regdel-link">Settings</a></li>
  <li><a href="/runtime/info" class="regdel-link not-production">Development</a></li>
</ul>
<div class="clear"></div>
</div>
</xsl:template>

<xsl:template name="sidebar">
<div class="block">
  <div class="hd">
  <h2>
    <span class="i18n-quick_links">Quick Links</span>
  </h2>
  </div>
  <div class="bd">
    <h3>
      <span class="i18n-actions">Actions</span>
    </h3>
    <ul class="biglist">
      <li>
        <a href="/" id="sb-new-entry" class="regdel-link">
          <span class="i18n-new_entry">Home</span>
        </a>
      </li>
    </ul>
  </div>
</div>
</xsl:template>
<xsl:template name="ads">
<div class="block">
  <div class="hd">
  <h2>
    <span class="i18n-quick_links">Sponsors</span>
  </h2>
  </div>
  <div class="bd" style="padding:1em 0;">
<script type="text/javascript"><xsl:comment>
google_ad_client = "pub-9657495873329253";
/* 300x250-wiki */
google_ad_slot = "6561520760";
google_ad_width = 300;
google_ad_height = 250;
//</xsl:comment></script> 
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> 
</script> 
  </div>
</div>
</xsl:template>

<xsl:template name="footer">
<div id="ft">
  <p class="inner">Copyright 
  <a href="http://www.savonix.com/">Savonix Corporation</a>. 
  AGPL Licensed
  </p>
</div>
</xsl:template>
</xsl:stylesheet>
