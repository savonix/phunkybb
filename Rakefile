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
  remote_task :mkdaemon do
    run "mkdir -p /tmp/#{@application}/log"
    run "echo '#!/bin/sh' > /tmp/#{@application}/run"
    run "echo 'exec /var/www/dev/#{@application}/current/demo.sh' >> /tmp/#{@application}/run"
    run "echo '#!/bin/sh' > /tmp/#{@application}/log/run"
    run "echo 'exec setuidgid daemon multilog t ./main' >> /tmp/#{@application}/log/run"
    run "sudo chown -R root:root /tmp/#{@application}"
    run "sudo chmod +x /tmp/#{@application}/run"
    run "sudo chmod +x /tmp/#{@application}/log/run"
    run "sudo mv /tmp/#{@application} /service/"
  end
  remote_task :restart do
    run "sudo svc -d /service/#{@application}"
    run "sudo svc -u /service/#{@application}"
  end
  remote_task :fix do
    run "mkdir -p /var/www/dev/#{@application}/current/public/d/xhtml"
    run "chmod 0777 /var/www/dev/#{@application}/current/public/d/xhtml"
  end
  task :deploy => [:update, :restart, :fix]
end

task :geturls do
  command = %q~ echo "myurls = Array.new" && cat notapp.rb | grep -E "get|r301|rewrite " | sed -r "s/    get //g" | sed -r "s/ do//g" | sed -r "s/[^\+]*\+'([^']+').+/'\/\1/g" | sort | uniq | awk '{print "myurls << " $1}'r~
  puts `#{command}`
end


task :makedemosh do
  puts %Q(
#!/bin/sh
cd /var/www/dev/#{@application}/current
exec /var/lib/gems/1.9.1/bin/unicorn -c /var/www/dev/#{@application}/current/config/unicorn_demo.conf --env demo -l 3030
)
end
task :makeuniconfdemo do
  puts %Q{
worker_processes 1

stderr_path "/tmp/webapps/#{@application}.log"
stdout_path "/tmp/webapps/#{@application}.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
GC.copy_on_write_friendly = true
}
end



task :makerackup do

  puts %Q{
if ENV['RACK_ENV'] == 'demo'
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
  
end


Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/*_spec.rb')
  t.spec_opts << '--format specdoc'
  t.rcov = true
  t.rcov_opts = ['--exclude', '/var/lib/gems,/usr/bin/spec,spec']
end