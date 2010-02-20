require 'rubygems'
require 'rake'
require 'spec/rake/spectask'


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
    run "sudo svc -d /service/regdel"
    run "sudo svc -u /service/regdel"
  end
  remote_task :fix do
    run 'mkdir /var/www/dev/regdel/current/public/d/xhtml'
    run 'chmod 0777 /var/www/dev/regdel/current/public/d/xhtml'
  end
  task :deploy => [:update, :restart, :fix]
end


Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/*_spec.rb')
  t.spec_opts << '--format specdoc'
  t.rcov = true
  t.rcov_opts = ['--exclude', '/var/lib/gems/1.8/gems,/usr/bin/spec,spec']
end