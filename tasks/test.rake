require 'colorize'
require './lib/blackjack/version'

namespace :test do

  desc 'Test game initialization'

  task :bvt do
    puts "Blackjack version #{BlackJack::VERSION}".green
  end


  task :default => [:bvt]
end

