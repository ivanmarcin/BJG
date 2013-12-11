require 'rubygems'
require 'colorize'
require 'lib/blackjack'

namespace :game do

  desc 'Starts the Game'
  task :start do

    puts "Welcome to BJ!..."
    @game = BlackJackGame::Game.new

  end

  task :default => [:start]

end

