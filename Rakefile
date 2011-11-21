require 'rubygems/specification'
require 'rubygems/package_task'
require 'rake/testtask'

$:.unshift File.join(File.dirname(__FILE__), "lib")
require "reni"

task :default => :test

desc "Run all tests"
Rake::TestTask.new("test") do |t|
  t.pattern = 'test/*.rb'
  t.verbose = true
  t.warning = true
end

desc "Build gem"
task :build do
  sh "gem build reni.gemspec"
end

desc "Install gem"
task :install do
  sh "sudo gem install reni-#{Reni::VERSION}.gem"
end

desc "Push to Gemcutter"
task :push do
  sh "gem push reni-#{Reni::VERSION}.gem"
end

desc "Clean up gem"
task :clean do
  sh "rm *.gem"
end

desc "Run demo"
task :demo do
  puts " ==> Starting demo: http://localhost:3000/"
  Dir.chdir("example") do
    sh "rackup -p 3000"
  end
end
