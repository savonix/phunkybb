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

use Crypt::RSA;

my $flow = Apache2::Aortica::Kernel::Flow->instance();

my $mpk = '/var/www/dev/phunkybb/config/key.pem';

open MYKEY, '<', $mpk || die("can't open datafile: $!");
my @key_lines = <MYKEY>;
close(MYKEY);

my $key = join( '', @key_lines );




my $ctxt = $flow->get_value_by_path("//_post/password");

my $rsa = new Crypt::RSA;
my $ptxt =
    $rsa->decrypt ( 
        Cyphertext => $ctxt,
        Key        => $key,
        Armour     => 1,
    ) || die $rsa->errstr();



my $node = $flow->{ DOC }->createElement("error_message");

$node->appendText("hi");
$flow->{ ROOT }->appendChild($node);
