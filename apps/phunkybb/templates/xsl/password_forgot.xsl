<!--
Program: PhunkyBB
Component: password.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="html_main.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="my18n"/>
    <div class="box">
      <div class="inform">
        <xsl:if test="not(//_post/email)">
          <form method="post" action="{$link_prefix}password-forgot-submit">
          Email address: <input type="text" name="email"/>
          <br/>
          <input type="submit"/>
          </form>
        </xsl:if>
        <xsl:if test="//_post/email">
          <xsl:if test="//user_get_by_email_or_username/user_get_by_email_or_username/email">
            Email sent to <xsl:value-of select="//user_get_by_email_or_username/user_get_by_email_or_username/username"/> .
          </xsl:if>
          <xsl:if test="not(//user_get_by_email_or_username)">
            Can't find a user with that email.
          </xsl:if>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
