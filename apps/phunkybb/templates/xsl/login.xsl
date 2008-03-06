<!--
Program: PhunkyBB
Component: post.xsl
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
<xsl:include href="main.xsl"/>
<xsl:template name="content">
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jquery-1.2.1.min.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/jsbn.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rsa.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/prng4.js"></script>
<script type="text/javascript" src="{__ROOT__/runtime/path_prefix}/s/js/rng.js"></script>
<script type="text/javascript">
$(document).ready(function() 
{
    var myform = document.forms["mlogin"];
    myform.id_rsa_pub.value="a5261939975948bb7a58dffe5ff54e65f0498f9175f5a09288810b8975871e99\naf3b5dd94057b0fc07535f5f97444504fa35169d461d0d30cf0192e307727c06\n5168c788771c561a9400fb49175e9e6aa4e23fe11af69e9412dd23b0cb6684c4\nc2429bce139e848ab26d0829073351f4acd36074eafd036a5eb83359d2a698d3";
    myform.e.value="10001";
});
/*
function do_encrypt() {
  var before = new Date();
  var rsa = new RSAKey();
  rsa.setPublic(document.rsatest.n.value, document.rsatest.e.value);
  var res = rsa.encrypt(document.rsatest.plaintext.value);
  var after = new Date();
  if(res) {
    document.rsatest.ciphertext.value = linebrk(res, 64);
    document.rsatest.cipherb64.value = linebrk(hex2b64(res), 64);
    document.rsatest.status.value = "Time: " + (after - before) + "ms";
  }
}
*/
function do_encrypt() {
    var myform = document.forms["mlogin"];
    var rsa = new RSAKey();
    rsa.setPublic(myform.id_rsa_pub.value, myform.e.value);
    var res = rsa.encrypt(myform.password.value);
    var after = new Date();

    $.post("<xsl:value-of select="//link_prefix"/>blah",
    {
        'username': myform.username.value, 
        'password': res
    }, 
    function (data){
        alert( ($("menu",data).attr("id")));
    });
}
</script>

<div class="blockform">
	<h2><span>Login</span></h2>

<div class="box">
<form id="mlogin" name="mlogin" method="post" action="{//link_prefix}login&amp;view_flow=true" onSubmit="do_encrypt(); return false;">
<input type="hidden" name="id_rsa_pub" value=""/>
<input type="hidden" name="e" value=""/>
    <div class="inform">
        <fieldset>
            <legend>Enter your username and password below</legend>
                <div class="infldset">
                    <label class="conl"><strong>Username</strong><br />
                    <input type="text" name="username" tabindex="1" /><br />
                    </label>
                    
                    <label class="conl"><strong>Password</strong><br />
                    <input type="password" name="password" tabindex="2" /><br />
                    </label>
                    
                    <p class="clearb">If you have not registered or have forgotten your password click on the appropriate link below.</p>
                    <p><a href="{//link_prefix}register" tabindex="4">Not registered yet?</a>
                    <!--  <a href="" tabindex="5">Forgotten your password?</a> -->
                    </p>
                </div>
        </fieldset>
    </div>
    <p><input type="submit" name="login" value="Login" tabindex="3" /></p>
</form>

</div>
</div>
<script type="text/javascript">
rng_seed_time();
</script>
</xsl:template>
</xsl:stylesheet>
