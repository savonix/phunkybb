<!--
Program: PhunkyBB
Component: dynamic_functions.js.xsl
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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="text" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
	<xsl:template match="/">

function zinit() {
    $.pir.options.php="http://192.168.8.103:88/p/gd.fcgi/";
    $("#header-name-text").pir({size: 18, font: "imposs.ttf", color: "#44465B"});
    $("#header-description").pir({size: 12, font: "imposs.ttf", color: "#44465B"});
}
function ztime() { return(new Date().getTime()); }
function quick() {
    if(!document.getElementById("header-name-text")) {
        if(ztime()-loadTime&lt;=1000) {
            setTimeout("quick()",10);
        } else {
            window.onload=zinit;
        }
    } else {
        zinit();
    }
}
var loadTime=ztime();
quick();


  <xsl:variable
    name   = "link_prefix"
    select = "/_R_/runtime/link_prefix"
  />

  function site_delete(site_id) {
    if(confirm('Are you sure?')){
      $.ajax(
      {
      type: "POST",
      url: "<xsl:value-of select="$link_prefix"/>x-site-delete&amp;site_id="+site_id,
      data: {
        'site_id': site_id
        },
        complete: function () {
          location.href="<xsl:value-of select="$link_prefix"/>sites";
        }
      });
    }
  }
  function topic_delete(topic_id) {
      if(confirm('Are you sure?')){
        $.ajax(
        {
        type: "POST",
        url: "<xsl:value-of select="$link_prefix"/>x-topic-delete&amp;topic_id="+topic_id,
        data: {
          'topic_id': topic_id
          },
          complete: function () {
            location.href="<xsl:value-of select="$link_prefix"/>index";
          }
        });
      }
  }
  function show_quickpost() {
    $("#quickpost").css("display","block");
  }
  function hide_quickpost() {
    $("#quickpost").hide();
  }
	</xsl:template>
</xsl:stylesheet>
