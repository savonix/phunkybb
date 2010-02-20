require 'rubygems'
require 'rake'
require 'spec/rake/spectask'


@application = 'notasinatraapp'
task :test => :spec
task :default => :spec

begin
  require "vlad"
  Vlad.load(:app => nil, :scm => "git")
rescue LoadError
  # do nothing
end

namespace :vlad do
  remote_task :restart do
    run "sudo svc -d /service/#{@application}"
    run "sudo svc -u /service/#{@application}"
  end
  task :deploy => [:update, :restart]
end

task :geturls do
  command = %q~ echo "myurls = Array.new" && cat notapp.rb | grep -E "get|r301|rewrite " | sed -r "s/    get //g" | sed -r "s/ do//g" | sed -r "s/[^\+]*\+'([^']+').+/'\/\1/g" | sort | uniq | awk '{print "myurls << " $1}'r~
  puts `#{command}`
end


task :makedemosh do
  demosh = %Q(#!/bin/sh
cd /var/www/dev/#{@application}/current
exec /var/lib/gems/1.9.1/gems/unicorn-0.95.3/bin/unicorn -c /var/www/dev/#{@application}/current/config/unicorn.conf --env demo -l 3010)

puts demosh

end


task :makerackup do

rackup = %Q{if ENV['RACK_ENV'] == 'demo'
  mountpath = '/demo/#{@application}/'
  dirpfx = '/var/www/dev/#{@application}/current'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/#{@application}/#{@application}.sqlite3'
elsif ENV['RACK_ENV'] == 'development'
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/#{@application}'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/#{@application}/#{@application}.sqlite3'
else
  mountpath = '/'
end

ENV['RACK_MOUNT_PATH'] = mountpath

require '#{@application}'

map mountpath do
  conf = Hash['uripfx', mountpath.gsub(/^\\/$/,'')]
  myapp = #{@application.capitalize}.new(conf)
  myapp.set :environment, ENV['RACK_ENV']
  run myapp
end
}

puts rackup

end


Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/*_spec.rb')
  t.spec_opts << '--format specdoc'
  t.rcov = true
  t.rcov_opts = ['--exclude', '/var/lib/gems/1.8/gems,/usr/bin/spec,spec']
end