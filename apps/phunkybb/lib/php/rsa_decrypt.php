<?php

// openssl genrsa -out key.pem
// openssl rsa -in key.pem -noout -modulus
// str_replace('Modulus=','',$modulus);

$mpk = PROJECT_ROOT.'/key.pem';
$pk = file_get_contents($mpk);
$private_key = openssl_pkey_get_private($pk);

/*
y3ifmFcgaFbGAp7GC4UGvenFuYi7p0NMVHc2XCPy33w6YiHj52TtaM5o0iiKw
xP6MhBXPa0Fc+UGk2Q0qr/m1Q==
*/

$encrypted_password = Nexista_Path::get('{//_post/password}');

$binary_pw = base64_decode($encrypted_password);

if(openssl_private_decrypt($binary_pw,&$clear,$private_key))
{
    // success
    Nexista_Flow::add("cleartext",$clear);
}
else
{
    // failure
    echo '<result>Failure</result>';
    exit;
}
?>
