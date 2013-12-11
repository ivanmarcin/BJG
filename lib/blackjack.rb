# encoding: UTF-8
require 'lib/blackjack/version'
require 'lib/blackjack/cards/deck'
require 'lib/blackjack/cards/card'
require 'lib/blackjack/cards/card_types'
require 'lib/blackjack/players/player'
require 'lib/blackjack/players/blackjack_player'
require 'lib/blackjack/players/dealer'
require 'lib/blackjack/game/game_logic'
require 'lib/blackjack/game/game_stats'
require 'lib/blackjack/game/board'


module BlackJackGame

  class Game
    attr_accessor :players
    attr_accessor :game_logic

    # Create a new player list and Game Deck
    def initialize
      @players = []
      @players.push(Dealer.new("Mr. Dealer"))
      @players.push(BlackJackPlayer.new("Human"))
      @game_logic = GameLogic.new(@players)
      start_game
    end

    # The Game
    def start_game
      #todo: make a loop of games until user chooses to exit
      @game_logic.game_round

      puts "Bye! thx for playing"
    end

  end

end
