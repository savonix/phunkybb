package phunkybb::apps::phunkybb::dispatchers::mod_perl::Phunkybb;
use Aortica::Aortica ();
use strict;
use Data::Dumper;
use DateTime;
use Cache::MemoryCache;
use Digest::MD5 qw(md5 md5_hex md5_base64);

#my $tree = Apache2::Directive::conftree();

#my $app_node = $tree->lookup('Location', '/phunkybb');
my $app_name = $ENV{'app_name'};
my $app_cfg  = $ENV{'app_conf'};
my $srv_cfg  = $ENV{'loc_conf'};
#my $app_cfg = $app_node->{ AppConfigFile };
#my $srv_cfg = $app_node->{ AorticaServerConfigFile };


Aortica::Kernel::Init->instance($srv_cfg, $app_cfg,'phunkybb');


sub handler {

    #$| = 1;
    my $r = shift;
    my $output;

    # This is necessary so that new request objects aren't created, see:
    # http://perl.apache.org/docs/2.0/user/config/config.html#C_GlobalRequest_
    Apache2::RequestUtil->request($r);
    my $req = Apache2::Request->new($r);
    my $nid = $req->param('nid');
    my $duration = undef;
    my $output = undef;
    my $gate_content_type = undef;

    # Create Gatekeeper
    my $init = Aortica::Kernel::Init->instance('phunkybb');
    $init->start();

    my $dbh = Aortica::Modules::DataSources::DBIDataSource->instance();
    $output = $init->process_gate($nid);


    {
        if ( $gate_content_type = $init->{ phunkybb }->{ GATE }->{ $nid }->{ CONTENT_TYPE } ) {
            # Memory leak???
            $r->content_type($gate_content_type);
        } elsif ( !$r->content_type ) {
            #$r->content_type("application/xhtml+xml");
            $r->content_type("text/html");
        }
    }

    my $mtime = time();
    $r->set_last_modified($mtime);
    $r->print($output);
    return Apache2::Const::OK;
}

1;
