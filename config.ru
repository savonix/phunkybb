if ENV['RACK_ENV'] == "demo"
  mountpath = '/demo/chimailmadmin/'
  dirpfx = '/var/www/dev/chimailmadmin/current'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/chimailr/rbeans.sqlite3'
elsif ENV['RACK_ENV'] == "development"
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/chimailmadmin'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/chimailmadmin/rbeans.sqlite3'
else
  mountpath = '/'
end

ENV['RACK_MOUNT_PATH'] = mountpath

require 'phunkybb'

map mountpath do
  conf = Hash['uripfx', mountpath.gsub(/^\/$/,'')]
  myapp = PhunkyBB.new(conf)
  myapp.set :environment, ENV['RACK_ENV']
  run myapp
end