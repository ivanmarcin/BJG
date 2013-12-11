#!/usr/bin/env ruby
# encoding: UTF-8
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../'))

require 'rubygems'
require 'rake'

module Rake
  class Application
    def find_rakefile_location
      ['Rakefile', File.expand_path(File.dirname(__FILE__) + '/../')]
    end

    def raw_load_rakefile
      rakefile, location = find_rakefile_location
      if (! options.ignore_system) && (options.load_system || rakefile.nil?) &&
          system_dir && File.directory?(system_dir)
        print_rakefile_directory(location)
        glob("#{system_dir}/*.rake") do |name|
          add_import name
        end
      else
        fail "No Rakefile found (looking for: #{@rakefiles.join(', ')})" if
            rakefile.nil?
        @rakefile = rakefile
        print_rakefile_directory(location)
        puts
        Rake.load_rakefile(File.join(location, rakefile))
      end
      load_imports
    end
  end
end

Rake.application.run