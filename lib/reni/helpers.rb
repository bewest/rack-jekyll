module Helpers
  def route(path_info)
    mimes = Rack::Mime::MIME_TYPES.map{|k,v| /#{k.gsub('.','\.')}$/i }
    
    if path_info =~ /(\/?)$/
      if mimes.collect {|regex| path_info =~ regex }.compact.empty?
        $1.nil? ? "/index.html" : "index.html"
      end
    end
  end
  
  def error_404
    ::File.exist?(@path+"/404.html") ? [404, file_info(@path+"/404.html")[:body], "404.html"] : [404, "Not found", "404.html"]
  end
  
  def mime(path_info)
    if path_info !~ /html$/i
      ext = $1 if path_info =~ /(\.\S+)$/
      Mime.mime_type((ext.nil? ? ".html" : ext))
    else
      Mime.mime_type(".html")
    end
  end

  def file_info(path)
    expand_path = ::File.expand_path(path)
    ::File.open(expand_path, 'r') do |f|
      {:body => f.read, :time => f.mtime.httpdate, :expand_path => expand_path}
    end
  end
end