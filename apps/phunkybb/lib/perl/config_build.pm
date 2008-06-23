
$flow = Apache2::Aortica::Kernel::Flow->instance();
$config_barf = $flow->get_value_by_path("/_R_/config_get/config_get")->{config_get}->{config_get};

# dereference the array
@config_array = @{$config_barf};

$config_cache = \@config_array;
$new_hash = {};
foreach my $item (@config_array) {
    $new_hash->{$item->{conf_name}} = $item->{conf_value};
}

