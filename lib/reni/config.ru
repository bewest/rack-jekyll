$:.unshift File.dirname(__FILE__)
require "reni"

# Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors

run Rack::URLMap.new( {
  "/" => Rack::Directory.new( "public" ), # Serve our static content
  "/" => Reni.new                 # Jekyll app
} )
