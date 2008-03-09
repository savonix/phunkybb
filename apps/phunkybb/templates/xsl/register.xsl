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
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jquery-1.2.1.min.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jsbn.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/prng4.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rng.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/base64.js"></script>
<script language="javascript" src="{//path_prefix}s/js/jsval.js"></script>
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
    var myform = document.forms["mlogin"];
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
    
        $.post("<xsl:value-of select="//link_prefix"/>register",
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
    <form name="register" method="post" onSubmit="do_encrypt()"
        action="{//request_uri}&amp;view_flow=true">
        <div class="inform">
            <div class="forminfo">
                <h3><xsl:value-of select="//label[key='important_information']/value"/></h3>
                <p>Registration will grant you access to a number of features and capabilities otherwise unavailable. 
                These functions include the ability to edit and delete posts, design your own signature that accompanies 
                your posts and much more. If you have any questions regarding this forum you should ask an administrator.</p>
                <p>Below is a form you must fill out in order to register. Once you are registered you should visit your 
                profile and review the different settings you can change. The fields below only make up a small part of 
                all the settings you can alter in your profile.</p>
            </div>
            <fieldset>
                <legend>Please enter a username between 2 and 25 characters long</legend>
                <div class="infldset">
                    <label><strong>Username</strong><br />
                    <input type="text" name="username" maxlength="25" value="{//_post/username}"/><br /></label>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend>Please enter and confirm your chosen password</legend>
                <div class="infldset">
                    <label class="conl"><strong>Password</strong><br /><input type="password" name="password1" size="16" maxlength="16" /><br /></label>
                    <label class="conl"><strong>Confirm password</strong><br /><input type="password" name="password2" size="16" maxlength="16" /><br /></label>
                    <p class="clearb">Passwords can be between 4 and 16 characters long. Passwords are case sensitive.</p>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend>Enter a valid e-mail address</legend>
                <div class="infldset">

                <label><strong>E-mail</strong><br />
                    <input type="text" name="email" maxlength="50"  value="{//_post/email}"/><br /></label>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend>Set your localisation options</legend>
                <div class="infldset">
                    <label>Timezone: For the forum to display times correctly you must select your local timezone.<br />
                    <select id="time_zone" name="timezone">
                    <xsl:for-each select="//tzdata/option">
                        <option value="{@value}"><xsl:value-of select="."/></option>
                    </xsl:for-each>
                    </select>
                    <br /></label>
                </div>
            </fieldset>
        </div>
        <div class="inform">
            <fieldset>
                <legend>Set your privacy options</legend>
                <div class="infldset">
                    <p>Select whether you want your e-mail address to be viewable to other users or not and if you want other users to be able to send you e-mail via the forum (form e-mail) or not.</p>
                    <div class="rbox">
                        <label><input type="radio" name="email_setting" value="0" />Display your e-mail address.<br /></label>
                        <label><input type="radio" name="email_setting" value="1" checked="checked" />Hide your e-mail address but allow form e-mail.<br /></label>
                        <label><input type="radio" name="email_setting" value="2" />Hide your e-mail address and disallow form e-mail.<br /></label>
                    </div>
                    <p>This option sets whether the forum should "remember" you between visits. If enabled, you will not have to login every time you visit the forum. You will be logged in automatically. Recommended.</p>
                    <div class="rbox">
                        <label><input type="checkbox" name="save_pass" value="1" checked="checked" />Save username and password between visits.<br /></label>
                    </div>
                </div>
            </fieldset>
        </div>
        <p><input type="submit" name="register" value="Register" /></p>
    </form>
</div>
</div>
<script language="javascript">
    initValidation();
    rng_seed_time();
</script>
</xsl:template>
</xsl:stylesheet>
