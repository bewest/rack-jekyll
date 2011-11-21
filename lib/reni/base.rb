module Reni
  class Base
    def initialize(opts = {})
      config_file = '_config.yml'
      if ::File.exist?(config_file)
        config = YAML.load_file(config_file)
        @path = (config[:destination].nil? && "_site") || config[:destination]

        @files = ::Dir[@path + "/**/*"].inspect
        @files unless ENV['RACK_DEBUG']
      end
  
      if ::Dir[@path + "/**/*"].empty?
        options = ::Jekyll.configuration(opts)
        site = ::Jekyll::Site.new(options)
        site.process
    
        @compiling = true
      else
        @compiling = false
      end
    end
    
    def call(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
      path_info = @request.path_info
      
      if @files.include?(path_info)
        path_info = route(path_info)
        mime = mime(path_info)

        file  = file_info(@path + path_info)
        body = file[:body]
        time = file[:time]

        if time == @request.env['HTTP_IF_MODIFIED_SINCE']
          [@response.status, {'Last-Modified' => time}, []]
        else
          [@response.status, {"Content-Type" => mime, "Content-length" => body.length.to_s, 'Last-Modified' => time}, [body]]
        end

      else
        if !@compiling
          status, body, path_info = error_404
          mime = mime(path_info)
          [status, {"Content-Type" => mime, "Content-length" => body.length.to_s}, [body]]
        else
          [200, {"Content-Type" => "text/plain"}, ["This site is currently generating pages. Please reload this page after 10 secs."]]
        end
      end
    end
  end
end