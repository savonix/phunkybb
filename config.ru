if ENV['RACK_ENV'] == "demo"
  mountpath = '/'
  dirpfx = '/var/www/dev/phunkybb/current'
elsif ENV['RACK_ENV'] == "development"
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/phunkybb'
else
  mountpath = '/'
end

ENV['RACK_MOUNT_PATH'] = mountpath

require 'phunkybb'

map mountpath do
  conf = Hash['uripfx', mountpath.gsub(/^\/$/,'')]
  myapp = PhunkyBB.new(conf)
  run myapp
end