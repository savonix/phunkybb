package phunkybb::apps::phunkybb::dispatchers::mod_perl::Phunkybb;
use Aortica::Aortica ();
use strict;
use Data::Dumper;
use DateTime;
use Cache::MemoryCache;
use Digest::MD5 qw(md5 md5_hex md5_base64);

my $tree = Apache2::Directive::conftree();

my $app_node = $tree->lookup('Location', '/phunkybb');
my $app_cfg = $app_node->{ AppConfigFile };
my $srv_cfg = $app_node->{ AorticaServerConfigFile };
our $doc;




# Create config
my $config = Aortica::Kernel::Config->instance();
$config->configure($srv_cfg, $app_cfg, 'phunkybb');

# Create fence
my $fence_file = $config->{ CONFIG }->{ phunkybb }->{build}->{sitemap};
my $fence = Aortica::Kernel::Fence->instance();
$fence->set_fence($fence_file, 'phunkybb');

Aortica::Kernel::Init->instance('phunkybb');
Aortica::Modules::Handlers::QueryHandler->instance('phunkybb');
Aortica::Modules::Handlers::XmlHandler->instance('phunkybb');
Aortica::Modules::Handlers::XslHandler->instance('phunkybb');



my $cache = new Cache::MemoryCache( { 'namespace' => 'MyNamespace',
                                    'default_expires_in' => 600 } );

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
    my $uri = md5_base64($ENV{'REQUEST_URI'});
    my $key = $nid.$uri;
    $init->start();

    my $output = $cache->get( $key );

    if ( not defined $output ) {

        my $dbh = Aortica::Modules::DataSources::DBIDataSource->instance();
        $output = $init->process_gate($nid);

        if( $req->param('view_flow') eq "true") {
            # Maybe create flow dom document, but populate it and flush it for each request
            my $flow = Aortica::Kernel::Flow->instance();
            $doc  = $flow->{ DOC };
            $output .= '<textarea rows="20" style="width: 100%">'.$flow->{ DOC }->toString.'</textarea>';
        }
        $cache->set( $key, $output, "10 minutes" );
    } else {
        if($ENV{'REQUEST_METHOD'} eq 'POST') {
            $cache->clear();
        }
    }

    $duration = $init->stop();
    $duration = sprintf("%.3f", $duration);
    {
        if ( $gate_content_type = $init->{ phunkybb }->{ GATE }->{ $nid }->{ CONTENT_TYPE } ) {
            # Memory leak???
            #unless($gate_content_type eq 'text/html') {
            $r->content_type($gate_content_type);
            #}
        } elsif ( !$r->content_type ) {
            $r->content_type("application/xhtml+xml");
        }
    }

    my $mem = GTop->new->proc_mem($$)->share/1024;
    my $proc_mem = GTop->new->proc_mem($$)->size/1024;
    my $diff     = $proc_mem - $mem;
    my $shared   = GTop->new->proc_mem($$)->vsize/1024;

    my $memory = " Shared: ".$mem." Total: ".$proc_mem." PID: ".$$ ;


















    unless ( $gate_content_type eq "text/xml") {
        $output =~ s/kwhfg4khgh587hg/"$duration.$memory"/g;
    }
    my $mtime = time();
    $r->set_last_modified($mtime);
    $r->print($output);
    return Apache2::Const::OK;
}

1;
