package phunkybb::apps::phunkybb::dispatchers::mod_perl::Phunkybb;
use Apache2::Aortica::Aortica ();



$tree = Apache2::Directive::conftree();
$node = $tree->lookup('Location', '/aortica');
$app_cfg = $node->{ AppConfigFile };

# Create config
$config = Apache2::Aortica::Kernel::Config->instance($app_cfg);

# Create fence
$fence_file = $config->{ CONFIG }->{build}->{sitemap};
$my_obj = Apache2::Aortica::Kernel::Fence->instance($fence_file);





sub handler {

    my $r = shift;
    my $output;
    my $req = Apache2::Request->new($r);
    my $nid = $req->param('nid');
    my $duration = undef;
    my $output = undef;

    # Create Gatekeeper
    my $init = Apache2::Aortica::Kernel::Init->instance();
    
    # Maybe create flow dom document, but populate it and flush it for each request
    my $flow = Apache2::Aortica::Kernel::Flow->instance();
    $doc  = $flow->{ DOC };
    $root = $flow->{ ROOT };

    my $dbh = Apache2::Aortica::Modules::DataSources::DBIDataSource->instance();
    $init->start();

    $flow->init();
    $output = $init->process_gate($nid);


    $duration = $init->stop();
    $duration = sprintf("%.3f", $duration);


    if( $req->param('view_flow') eq "true") {
        $output .= '<textarea rows="20" style="width: 100%">'.$flow->{ DOC }->toString.'</textarea>';
    }
    my $mem = GTop->new->proc_mem($$)->share/1024;
    my $proc_mem = GTop->new->proc_mem($$)->size/1024;
    my $diff     = $proc_mem - $mem;
    my $shared   = GTop->new->proc_mem($$)->vsize/1024;

    my $memory = " Shared: ".$mem." Total: ".$proc_mem." PID: ".$$ ;


























    $r->print($output);
    $r->print($duration);
    $r->print($memory);
    undef $output;
    $dbh->datasource_disconnect();
    return Apache2::Const::OK;
}

1;
