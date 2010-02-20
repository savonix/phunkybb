require File.dirname(__FILE__) + '/notapp'

conf = Hash["a", 300, "b", 201]
myapp = Notapp.new(conf)
myapp.set :environment, 'development'
run myapp