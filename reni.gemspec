$:.unshift File.join(File.dirname(__FILE__), "lib")
require "reni"

Gem::Specification.new do |s|
 s.required_rubygems_version = ">= 1.3.6"
 
 s.name    	= 'reni'
 s.version	= Reni::VERSION
 s.description	= "Transform your jekyll based app into a Rack application"
 s.summary	= "reni"
 
 s.authors	= ['Adão Raul', 'Bryan Goines']
 s.email	= 'adao.raul@gmail.com'
 
 s.files 	= ['README.markdown', 'LICENSE', 'lib/reni.rb', 'lib/reni/base.rb', 'lib/reni/helpers.rb']
 
 s.extra_rdoc_files	= %w[README.markdown]
 s.homepage = "http://github.com/adaoraul/reni"
 s.require_paths = %w[lib]
 s.rubyforge_project = 'reni'
 s.rubygems_version = '1.3.1'
 s.add_dependency 'jekyll', "~> 0.11.0"
 s.add_dependency 'rack', "~> 1.3.2"
 s.platform = Gem::Platform::RUBY
end
