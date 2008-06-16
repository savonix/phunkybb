sub handler {

    my $r = shift;

    my $session = Apache2::Aortica::Kernel::Session->instance();
    my $my_session = $session->start();

    # Parse request
    my $nid = "index";
    $flow->init();
    # Match to a gate and parse gate items as SAX events or pull parser
    $init->process_gate();

    # These handlers are used for examples, should be done by gate processor
    Apache2::Aortica::Modules::Handlers::XmlHandler::process();
    my $output = Apache2::Aortica::Modules::Handlers::XslHandler::process('/var/www/bloggitplace/blog-it.xsl');

    # Flush Flow
    $root->removeChildNodes();

    # Print Output
    $r->print($output);
    return Apache2::Const::OK;

}

