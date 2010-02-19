#!/usr/bin/rackup1.8
require File.dirname(__FILE__) + '/notapp'

conf = Hash["a", 300, "b", 201]
run Notapp.new(conf)