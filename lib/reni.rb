$:.unshift File.dirname(__FILE__)

require "yaml"
require "rack"
require "rack/request"
require "rack/response"
require "jekyll"
require "reni/helpers"
require "reni/base"

module Reni
  VERSION = "0.4.0"
end
