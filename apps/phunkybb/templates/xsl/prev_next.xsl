<!--
Program: PhunkyBB
Component: prev_next.xsl
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
<xsl:template name="previous_next">
<xsl:param name="qsa"/>
<xsl:if test="(/_R_/_get/start!=0) and not(/_R_/_get/start='NaN')">
<a href="{//link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={/_R_/_get/start - //incr}">Previous</a>
&#160;
<a href="{//link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={/_R_/_get/start + //incr}">Next</a>
</xsl:if>

<xsl:if test="(/_R_/_get/start=0) or not(/_R_/_get/start)">
Previous
&#160;
<a href="{//link_prefix}{/_R_/_get/nid}{$qsa}&amp;start={//incr}">Next</a>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
