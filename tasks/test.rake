require 'colorize'

#TODO: add real tests
namespace :test do

  desc 'Test game initialization'

  task :bvt do
    require './lib/blackjack/version'
    puts "Blackjack version #{BlackJack::VERSION}".green
  end

  task :default => [:bvt]
end

