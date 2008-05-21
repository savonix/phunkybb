<!--
Program: PhunkyBB
Component: previous_next.xsl
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

<table>
    <tr>
        <xsl:if test="(/__ROOT__/_get/start!=0) and not(/__ROOT__/_get/start='NaN')">
        <td>
        <a href="{//link_prefix}{//_get/nid}&amp;start={//_get/start - //incr + 1}" 
            class="button-basic-blue">Previous</a>
        </td>

        <td>
        <input type="button" value="Next"
        onclick="document.location.href='{//link_prefix}{//_get/nid}&amp;start={//_get/start + //incr + 1}'"/>
        </td>
        </xsl:if>

        <xsl:if test="(//_get/start=0) or not(//_get/start)">
        <td>
        <input type="button" value="Previous" disabled="disabled">
        </input>
        </td>

        <td>
        <a href="{//link_prefix}{//_get/nid}&amp;fid={//_get/fid}&amp;id={//_get/id}&amp;start={//_get/start + //incr + 1}" 
            class="button-basic-blue">Next</a>
        </td>
        </xsl:if>
    </tr>
</table>
</xsl:template>
</xsl:stylesheet>
