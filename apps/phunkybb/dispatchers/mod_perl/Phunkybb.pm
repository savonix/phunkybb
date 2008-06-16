package phunkybb::apps::phunkybb::dispatchers::mod_perl::Phunkybb;
use Apache2::Aortica::Aortica;

sub handler {

    my $r = shift;
    # Create Gatekeeper
    my $init = Apache2::Aortica::Kernel::Init->instance();

    # Start the Gatekeeper
    $init->start();

    # Maybe create flow dom document, but populate it and flush it for each request
    my $flow = Apache2::Aortica::Kernel::Flow->instance();
    my $doc  = $flow->{ DOC };
    my $root = $flow->{ ROOT };

    my $session = Apache2::Aortica::Kernel::Session->instance();
    my $my_session = $session->start();

    # Parse request
    my $nid = "index";

    $flow->init();
    # Match to a gate and parse gate items
    $init->process_gate();

    # These handlers are used for examples, should be done by gate processor
    #my $output = $flow->{ DOC }->toString;
    my $output = $init->display();
    # Flush Flow
    $root->removeChildNodes();

    # Print Output
    $r->print($output);
    return Apache2::Const::OK;

}

1;
