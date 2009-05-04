=pod
<!--
Program: PhunkyBB
Component: config_build.pl
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
=cut
use XML::Simple;
use XML::LibXML;
{
my $xml_file = '/tmp/config_cache.xml';
my $parser = XML::LibXML->new();
my $flow = Aortica::Kernel::Flow->instance();

unless ( -e $xml_file ) {
    my $config_barf = $flow->get_value_by_path("/_R_/config_get/config_get")->{config_get}->{config_get};

    # dereference the array
    @config_array = @{$config_barf};

    $config_cache = \@config_array;
    my $new_hash = {};
    foreach my $item (@config_array) {
        $new_hash->{$item->{conf_name}} = $item->{conf_value};
    }

    my $xml_str = XMLout($new_hash, RootName => 'board_config', NoAttr => 1, OutputFile => $xml_file);
} else {
    $flow->add("config_cache", "true");
}


my $xml = $parser->parse_file( $xml_file  );
my $node = $flow->{ DOC }->importNode($xml->documentElement());
$flow->{ ROOT }->appendChild($node);
undef $node;
undef $xml;
}
