<?php

// openssl genrsa -out key.pem
// openssl rsa -in key.pem -noout -modulus
// str_replace('Modulus=','',$modulus);
// put modulus in config.xml defaults

$mpk = PROJECT_ROOT.'/config/key.pem';
$pk = file_get_contents($mpk);
$private_key = openssl_pkey_get_private($pk);


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
