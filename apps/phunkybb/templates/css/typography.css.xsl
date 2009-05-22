<!--
Program: PhunkyBB
Component: typography.css.xsl
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
<xsl:template name="typography">
body {
  font-family: sans-serif;
	font-size: 11px;
}
pre {
	font-family: courier, monospace;
	font-size: 1.2em;
}

h3 {
	font-size: 1.1em;
}
#header-name {
	font-size: 1.4em;
}
#header-description {
	font-size: 1.2em;
  line-height: 2em;
}


#menu-menu a:hover {
	text-decoration: underline;
}

#footer p {
  text-align: right;
  line-height: 2em;
}
h2.topic_h2 {
	font-size: .8em;
}
span.noul a, a.noul {
  text-decoration: none !important;
}
</xsl:template>
</xsl:stylesheet>