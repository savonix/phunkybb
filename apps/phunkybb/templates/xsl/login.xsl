<!--
Program: PhunkyBB
Component: login.xsl
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
<xsl:include href="html_main.xsl"/>
<xsl:template name="content">
<script type="text/javascript" src="{_R_/runtime/path_prefix}/s/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="{_R_/runtime/path_prefix}/s/js/rsa/rsa.js"></script>
<script type="text/javascript" src="{_R_/runtime/path_prefix}/s/js/rsa/prng4.js"></script>
<script type="text/javascript" src="{_R_/runtime/path_prefix}/s/js/rsa/rng.js"></script>
<script type="text/javascript" src="{_R_/runtime/path_prefix}/s/js/rsa/base64.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
    var myform = document.forms["mlogin"];
    myform.id_rsa_pub.value = "<xsl:value-of select="//defaults/modulus"/>";
    myform.e.value = "10001";
    var d = new Date();
    myform.my_tz_offset.value = 0 - d.getTimezoneOffset()/60;
    myform.my_tz_offset_debug.value = 0 - d.getTimezoneOffset()/60;
    $(function() {
        $('#login_button').disableTextSelect();
    });
});

function do_encrypt() {
    $('span#login_button').removeClass("button-basic-blue");
    $('span#login_button').addClass("button-basic-green");
    $('span#replace').css("visibility","visible");
    $('span#replace').html("<xsl:value-of select="/_R_/i18n/label[key='working']/value"/>...");

    var myform = document.forms["mlogin"];
    var rsa = new RSAKey();
    rsa.setPublic(linebrk(myform.id_rsa_pub.value,64), myform.e.value);
    var res = linebrk(hex2b64(rsa.encrypt(myform.password.value)),64);

    $.post("<xsl:value-of select="//link_prefix"/>x-login",
    {
        'username': myform.username.value,
        'password': res,
        'my_tz_offset': myform.my_tz_offset.value
    },
    function (data){
        var myResult = $("result",data).text();
        $('span#replace').html(myResult);
        if(myResult=='Success') {
            window.location = '<xsl:value-of select="//link_prefix"/>index';
        }
    });
}
</script>
<div class="blockform">
<h2><xsl:value-of select="/_R_/i18n/label[key='login']/value"/></h2>

<div class="box">
<form id="mlogin" name="mlogin" method="post" action="{//link_prefix}login"
    onSubmit="do_encrypt(); return false;">
<input type="hidden" name="id_rsa_pub" value=""/>
<input type="hidden" name="e" value=""/>
<input type="hidden" name="my_tz_offset" value=""/>
    <div class="inform">
        <fieldset>
            <legend><xsl:value-of select="/_R_/i18n/label[key='enter_username']/value"/></legend>
            <div class="infldset">
            <label class="conl"><strong><xsl:value-of select="/_R_/i18n/label[key='username']/value"/></strong><br/>
            <input type="text" name="username"/><br/>
            </label>

            <label class="conl"><strong><xsl:value-of select="/_R_/i18n/label[key='password']/value"/></strong><br/>
            <input type="password" name="password"/><br/>
            </label>

            <p><a href="{//link_prefix}register"><xsl:value-of select="/_R_/i18n/label[key='not_registered_yet']/value"/>?</a>
            <div style="visibility: hidden;" id="failure"><a href="">Forgotten your password?</a></div>
            </p>
            </div>
        </fieldset>
    </div>
    <p>
        <span id="login_button" class="button-basic-blue disableSelection" onclick="do_encrypt();">Submit</span>
        <span id="replace" class="interstatus"></span>
        <noscript><span id="replace" class="interstatus">Javascript must be enabled to log in.</span></noscript>
        <input type="submit" style="visibility: hidden;"/>
    </p>
</form>

</div>
</div>
<script type="text/javascript">
rng_seed_time();
</script>
</xsl:template>
</xsl:stylesheet>
