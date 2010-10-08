require "rubygems"

# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle update`."
  exit!
end if File.exist?(gemfile)

Bundler.require(:default) if defined?(Bundler)
require 'yajl' # gemspec in Gemfile pulls from gemspec, but cant define custom require statements there!

require 'net/http'
require 'cgi'

module Trademe
end

require "trademe/models/listing"
require "trademe/models/user"
require "trademe/models/authenticated_user"
require "trademe/authentication"
require "trademe/gateway"