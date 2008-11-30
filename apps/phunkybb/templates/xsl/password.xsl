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
    <script type="text/javascript" src="{/_R_/runtime/path_prefix}/s/js/rsa/jsbn.js"></script>
    <script type="text/javascript" src="{/_R_/runtime/path_prefix}/s/js/rsa/rsa.js"></script>
    <script type="text/javascript" src="{/_R_/runtime/path_prefix}/s/js/rsa/prng4.js"></script>
    <script type="text/javascript" src="{/_R_/runtime/path_prefix}/s/js/rsa/rng.js"></script>
    <script type="text/javascript" src="{/_R_/runtime/path_prefix}/s/js/rsa/base64.js"></script>

    <script type="text/javascript">
$(document).ready(function()
{
    var myform = document.forms["password"];
    myform.id_rsa_pub.value="<xsl:value-of select="//defaults/modulus"/>";
    myform.e.value="10001";
    $(function() {
        $('#register_button').disableTextSelect();
    });
});

function do_encrypt() {

    $('span#login_button').removeClass("button-basic-blue");
    $('span#login_button').addClass("button-basic-green");
    $('span#replace').css("visibility","visible");
    $('span#replace').html("<xsl:value-of select="$my18n/working"/>...");
    
    if(validateStandard(this))
    {
        var myform = document.forms["password"];
        var rsa = new RSAKey();
        rsa.setPublic(linebrk(myform.id_rsa_pub.value,64), myform.e.value);
        var res = linebrk(hex2b64(rsa.encrypt(myform.password.value)),64);

        $.post("<xsl:value-of select="$link_prefix"/>password",
        {
            'password': res
        },
        function (data){
            var myResult = $("result",data).text();
            $('span#replace').html(myResult);
            if(myResult=='Success') {
                window.location = '<xsl:value-of select="$link_prefix"/>profile';
            }
        });
    } else {
        $('span#replace').html("<xsl:value-of select="$my18n/invalid_registration"/>");
    }
}
</script>

    <div id="install" class="blockform">
      <div class="block">
        <h2 class="block2">
          <xsl:value-of select="$my18n/change_password"/>
        </h2>
        <div class="box">
          <form id="password" name="password" method="post" onSubmit="do_encrypt(); return false;">
            <input type="hidden" name="id_rsa_pub" value=""/>
            <input type="hidden" name="e" value=""/>
            <div class="inform">
              <fieldset>
                <legend>
                  <xsl:value-of select="$my18n/pass_legend_1"/>
                </legend>
                <div class="infldset">
                  <label class="conl">
                    <strong>
                      <xsl:value-of select="$my18n/password"/>
                    </strong>
                    <br/>
                    <input type="password" name="password" size="16" maxlength="16"/>
                    <br/>
                  </label>
                  <label class="conl">
                    <strong>
                      <xsl:value-of select="$my18n/confirm_password"/>
                    </strong>
                    <br/>
                    <input type="password" name="password2" size="16" maxlength="16"/>
                    <br/>
                  </label>
                  <p class="clearb">
                    <xsl:value-of select="$my18n/pass_info"/>
                  </p>
                </div>
              </fieldset>
            </div>
            <br/>
            <span id="submit" class="button-basic-blue disableSelection" onClick="do_encrypt(); return false;">Submit</span>
            <span id="replace" class="interstatus"></span>
            <input type="submit" style="visibility: hidden;"/>
          </form>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
