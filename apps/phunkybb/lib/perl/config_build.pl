use XML::Simple;
use XML::LibXML;
{
my $xml_file = '/tmp/config_cache.xml';
my $parser = XML::LibXML->new();
my $flow = Apache2::Aortica::Kernel::Flow->instance();

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
