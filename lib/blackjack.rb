# encoding: UTF-8
require 'lib/blackjack/version'
require 'lib/blackjack/cards/deck'
require 'lib/blackjack/cards/card_types'
require 'lib/blackjack/game/player'
require 'lib/blackjack/game/blackjack_player'
require 'lib/blackjack/game/game_logic'
require 'lib/blackjack/game/game_stats'
require 'lib/blackjack/game/board'


module BlackJackGame

  class Game
    attr_accessor :players

    def initialize
      @players = []
      @players.push(BlackJackPlayer.new("Dealer"))
      @players.push(BlackJackPlayer.new("Two"))

      game_loop
    end

    # Main Game Loop
    def game_loop
      while true do
        Board.re_draw(@players)
        sleep(0.25) # We don't need a 60fps console game :)
      end
    end

  end

end
