require 'kramdown'

class DocumentationController < ApplicationController
  
  def index

    modules_dir = '/etc/puppetlabs/puppet/modules'
    @uri = request.path.split('/')
    @path = request.path.sub(/\/$/, '')
    @dir = "#{modules_dir}/#{request.path.sub(/^\/documentation/, '')}"


    if File.directory?(@dir)
      if File.exists?("#{@dir}/README.md")
        @file = "README.md"
      elsif File.exists?("#{@dir}/README.markdown")
        @file = "README.markdown"
      elsif File.exists?("#{@dir}/README")
        @file = "README"
      else
        @file = ""
      end
    else
      @dir.gsub!(/\/[^\/]+$/,"")
      @file = @uri.pop
    end

    @subs = getFiles(@dir)

    begin
      @content = Kramdown::Document.new(File.read("#{@dir}/#{@file}"), {
        :coderay_default_lang => 'ruby',
        :coderay_line_numbers => nil,
        :coderay_tab_width    => 2,
      } ).to_html
    rescue
      @content = '<h1>Documentation</h1>'
    end

  end

  def getFiles(dir)
    subs = {
      :dirs => [],
      :files => []
    }

    Dir.foreach(dir) { |sub|
      #next if sub.match( /^(readme(\.md|\.markdown)?|\..*)$/i )

      if File.directory?("#{dir}/#{sub}") && sub !~ /^(lib|test|spec|manifest|files|template|\..*)/i
        subs[:dirs].push(sub)
      elsif sub.match(/^.*(md|markdown)/i) && sub !~ (/^(README(\.md|\.markdown)?|^\..*)$/i)
        subs[:files].push(sub)
      end
    }
    subs[:dirs].sort!
    subs[:files].sort!
    return subs
  end
end
