=pod
Program: PhunkyBB
Component: decrypt_rsa.pl
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
=cut

# apt-get install libcrypt-openssl-rsa-perl


use Crypt::OpenSSL::RSA;
use Apache2::Aortica::Kernel::Flow;
use MIME::Base64;
use Digest::SHA1  qw(sha1 sha1_hex sha1_base64);

my $flow = Apache2::Aortica::Kernel::Flow->instance();

my $mpk = '/var/www/dev/phunkybb/config/key.pem';

my $ctxt;
my $ptxt;

open MYKEY, '<', $mpk || die("can't open datafile: $!");
my @key_lines = <MYKEY>;
close(MYKEY);

my $key = join( '', @key_lines );
my $private;

$ctxt = $flow->get_value_by_path("//_post/password");
my $ctxt_bin = decode_base64($ctxt);

eval {
    $private = Crypt::OpenSSL::RSA->new_private_key($key);
    $private->use_sslv23_padding();
};

eval {
    $ptxt = $private->decrypt($ctxt_bin);
};
if ( $@ ) {
    $ptxt = $@;
}




my $sha1pw = sha1_hex($ptxt);

my $node = $flow->{ DOC }->createElement("error_message");

$node->appendText("");
$flow->{ ROOT }->appendChild($node);

my $pw = $flow->{ DOC }->createElement("hash");

$pw->appendText($sha1pw);
$flow->{ ROOT }->appendChild($pw);



