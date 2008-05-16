<!--
Program: PhunkyBB
Component: register.xsl
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
<xsl:include href="main.xsl"/>
<xsl:template name="content">
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa/rsa.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa/prng4.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa/rng.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa/base64.js"></script>
<script language="javascript">
<![CDATA[
    function initValidation()
    {
        var objForm = document.forms["register"];
        objForm.username.required = 1;
        objForm.username.minlength = 2;
        objForm.username.maxlength = 25;
        objForm.email.required = 1;
        objForm.email.regexp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    }
]]>
</script>
<script type="text/javascript">
$(document).ready(function()
{
    var myform = document.forms["register"];
    myform.id_rsa_pub.value="<xsl:value-of select="//defaults/modulus"/>";
    myform.e.value="10001";
});

function do_encrypt() {

    if(validateStandard(this))
        {
        var myform = document.forms["register"];
        var rsa = new RSAKey();
        rsa.setPublic(linebrk(myform.id_rsa_pub.value,64), myform.e.value);
        var res = linebrk(hex2b64(rsa.encrypt(myform.password.value)),64);

        $.post("<xsl:value-of select="//link_prefix"/>x-register",
        {
            'username': myform.username.value,
            'password': res
        },
        function (data){
            document.getElementById("replace").value = $("result",data).text();
        });
    }
}
</script>
<div class="blockform">
<h2><span><xsl:value-of select="//label[key='register']/value"/></span></h2>
<div class="box">
    <div id="replace"></div>
    <form id="register" name="register" method="post" onSubmit="do_encrypt(); return false;"
        action="{//link_prefix}register">
        <!--
        <input type="text" name="replace" value=""/>
        -->
        <input type="hidden" name="id_rsa_pub" value=""/>
        <input type="hidden" name="e" value=""/>
        <div class="inform">
            <div class="forminfo">
                <h3><xsl:value-of select="//label[key='important_information']/value"/></h3>
                <p><xsl:value-of select="//label[key='reg_desc_1']/value"/></p>
                <p><xsl:value-of select="//label[key='reg_desc_2']/value"/></p>
            </div>
            <fieldset>
                <legend><xsl:value-of select="//label[key='username_legend']/value"/></legend>
                <div class="infldset">
                    <label><strong><xsl:value-of select="//label[key='username']/value"/></strong><br/>
                    <input type="text" name="username" maxlength="25" value="{//_post/username}"/><br/></label>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend><xsl:value-of select="//label[key='pass_legend_1']/value"/></legend>
                <div class="infldset">
                    <label class="conl"><strong><xsl:value-of select="//label[key='password']/value"/></strong><br/><input type="password" name="password" size="16" maxlength="16" /><br/></label>
                    <label class="conl"><strong><xsl:value-of select="//label[key='confirm_password']/value"/></strong><br/><input type="password" name="password2" size="16" maxlength="16" /><br/></label>
                    <p class="clearb"><xsl:value-of select="//label[key='pass_info']/value"/></p>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend><xsl:value-of select="//label[key='valid_email']/value"/></legend>
                <div class="infldset">

                <label><strong><xsl:value-of select="//label[key='email']/value"/></strong><br/>
                    <input type="text" name="email" maxlength="50" value="{//_post/email}"/><br/></label>
                </div>
            </fieldset>
        </div>
        <p><input type="submit" name="register" value="Register"/></p>
    </form>
</div>
</div>
<script language="javascript">
    initValidation();
    rng_seed_time();
</script>
</xsl:template>
</xsl:stylesheet>
