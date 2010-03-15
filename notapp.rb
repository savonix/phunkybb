###
# Program:: http://www.docunext.com/wiki/Sinatra
# Component:: notapp.rb
# Copyright:: Savonix Corporation
# Author:: Albert L. Lash, IV
# License:: Gnu Affero Public License version 3
# http://www.gnu.org/licenses
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, see http://www.gnu.org/licenses
# or write to the Free Software Foundation, Inc., 51 Franklin Street,
# Fifth Floor, Boston, MA 02110-1301 USA
##
require 'rubygems'
require 'sinatra/base'
require 'rack/utils'
require 'rack/contrib'
require 'builder'
require 'sass'
require 'xml/xslt'
require 'rack-xslview'
require 'rack/cache'
require 'sinatra/xslview'
require 'rexml/document'
require 'memcache'
require 'mongo'
require 'json'
require 'redis'


# The container for the Notapp application
module Notapp

  class << self
    attr_accessor(:conf, :runtime)
  end

  # Create the app which will run
  def self.new(conf)
    self.conf = conf
    Main
  end

  # The sub-classed Sinatra application
  class Main < Sinatra::Base


    configure do
      set :static, true
      set :public, 'public'
      set :xslviews, 'views/xsl/'
      set :uripfx, '/'

      # Set request.env with application mount path
      use Rack::Config do |env|
        env['RACK_ENV'] = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
        env['RACK_MOUNT_PATH'] = Notapp.conf['uripfx']
      end

      Notapp.runtime = Hash.new
      # Setup XSL - better to do this only once
      Notapp.runtime['xslt']    = XML::XSLT.new()
      Notapp.runtime['xslfile'] = File.open('views/xsl/html_main.xsl').read
      Notapp.runtime['xslt'].xsl = REXML::Document.new Notapp.runtime['xslfile']

      # Setup paths to remove from Rack::XSLView, and params to include
      Notapp.runtime['omitxsl'] = ['/raw/', '/s/js/', '/s/css/', '/s/img/']
      Notapp.runtime['passenv'] = ['PATH_INFO', 'RACK_MOUNT_PATH', 'RACK_ENV']

      # Used in runtime/info
      Notapp.runtime['started_at'] = Time.now.to_i
      
      
      Notapp.runtime['mgdb'] = Mongo::Connection.new.db("my_mongo_db")
      
      Notapp.runtime['rdsc'] = Redis.new

    end
    configure :development do
      set :logging, true
      set :reload_templates, true
      set :dump_errors, true
      set :raise_errors, true
      Notapp.runtime['caching'] = 0
    end

    configure :test do
      #
    end

    configure :demo do
      set :logging, true
      set :reload_templates, false
      set :dump_errors, true
      set :raise_errors, false
      error do
        halt 404
      end
    end

    use Rack::Rewrite do
      rewrite Notapp.conf['uripfx']+'news/entry/create', '/s/xhtml/entry_form.html'
    end

    unless ENV['RACK_ENV'] == 'development'
      set :reload_templates, false
      Notapp.runtime['caching'] = 1
      use Rack::Cache,
        :verbose     => ENV['RACK_ENV'] == 'development' ? true : false,
        :metastore   => 'file:/tmp/cache/rack/meta',
        :entitystore => 'file:/tmp/cache/rack/body'
    end

    # Use Rack-XSLView
    use Rack::XSLView,
      :myxsl => Notapp.runtime['xslt'],
      :noxsl => Notapp.runtime['omitxsl'],
      :passenv => Notapp.runtime['passenv'],
      :xslfile => Notapp.runtime['xslfile'],
      :reload => ENV['RACK_ENV'] == 'development' ? true : false

    # Sinatra Helper Gems
    helpers Sinatra::XSLView

    helpers do
      # Just the usual Sinatra redirect with App prefix
      def mredirect(uri)
        redirect Notapp.conf['uripfx']+uri
      end
      def markdown(template, options={})
        output = render :md, template, options
        '<div>'+output+'</div>'
      end
    end

    #unless :agent.to_s =~ /(Slurp|msnbot|Googlebot)/ || request.env['REQUEST_URI'].gsub(/\/s\//)
    unless :agent.to_s =~ /(Slurp|msnbot|Googlebot)/
      #use Rack::Session::Memcache, :key => 'notapp', :domain => 'dev-48-gl.savonix.com', :expire_after => 60 * 60 * 24 * 365, :memcache_server => '192.168.8.2:11211'
    end

    get '/' do
      cache_control :public, :max_age => 30
      #session[:message] = ''
      @uptime = (0 + Time.now.to_i - Notapp.runtime['started_at']).to_s
      @enviro = settings.environment
      runtime = builder :'xml/runtime'
      running = xslview runtime, 'runtime.xsl'
      readme  = markdown :'md/README'
      '<div>' + running + readme + '</div>'
    end

    get '/raw/runtime/info' do
      cache_control :public, :max_age => 30
      content_type :xml
      #session[:message] = ''
      @uptime = (0 + Time.now.to_i - Notapp.runtime['started_at']).to_s
      @enviro = settings.environment
      builder :'xml/runtime'
    end

    get '/redis/test/ok' do
      Notapp.runtime['rdsc']['ok'] = 'ji'
      Notapp.runtime['rdsc'].set_add 'foo-tags', Time.now.to_i
      mredirect 'raw/redis/test/oj'
    end

    get '/raw/redis/test/oj' do
      content = Notapp.runtime['rdsc']['ok']
      content << Notapp.runtime['rdsc'].set_members('foo-tags').to_s
      content
    end

    get '/zoo/new' do
      coll = Notapp.runtime['mgdb'].collection("zoos")
      coll.insert({:animals=>["Marty","Fred"]})
      mredirect 'raw/hello'
    end
    get '/nonzoo/new' do
      coll = Notapp.runtime['mgdb'].collection("zoos")
      coll.insert({:trainers=>["Steve"]})
      mredirect 'raw/hello'
    end
    get '/raw/hello' do
      content_type :json
      names = []
      Notapp.runtime['mgdb'].collection_names.each { |name|
        names << name
      }
      coll = Notapp.runtime['mgdb'].collection("zoos")
      coll.find().each { |row|
        names << row
      }
      names.to_json
    end
    get '/raw/hi' do
      names = []
      Notapp.runtime['mgdb'].collection_names.each { |name|
        names << name
      }
      coll = Notapp.runtime['mgdb'].collection("zoos")
      coll.find().each { |row|
        names << row
      }
      names.last['trainers'][0].to_s
    end

    not_found do
      headers 'Last-Modified' => Time.now.httpdate, 'Cache-Control' => 'no-store'
      content = "<h3 id=\"page-title\">Error</h3>\n\nThis resource is unavailable. [Start over?](#{Notapp.conf['uripfx']})\n\n"
      content << "<div><![CDATA[#{request.env['sinatra.error'].name}]]></div>" if request.env['sinatra.error']
      content << "<div><![CDATA[#{request.env['sinatra.error'].message}]]></div>" if request.env['sinatra.error']
      markdown content
    end

    get '/stylesheet.css' do
      content_type 'text/css', :charset => 'utf-8'
      sass 'css/notapp'.to_sym
    end
  end
end

if __FILE__ == $0
  conf = Hash['uripfx','/']
  myapp = Notapp.new(conf)
  myapp.set :environment, 'development'
  myapp.run!
end