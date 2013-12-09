$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'java'
require 'colorize'

# JRuby boilerplate
Dir[File.expand_path(File.dirname(__FILE__) + '/lib/java/*.jar')].each { |jar_file| require jar_file }

# You can find the various tasks located in logical .rake files
# inside of the tasks/ directory
Dir[File.expand_path(File.dirname(__FILE__) + '/tasks/*.rake')].each do |f|
  begin
    load f
    puts "Loading #{f}".blue
  rescue LoadError => ex
    puts "Failed to load #{f}"
    puts ex
    puts ex.backtrace
    exit 1
  end
end

task :default => ['test:bvt']
