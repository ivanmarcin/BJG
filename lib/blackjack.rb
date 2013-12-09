# encoding: UTF-8
require 'lib/blackjack/version'
require 'lib/blackjack/cards/deck'
require 'lib/blackjack/cards/card_types'


module BlackJackGame

  class Game

    def initialize
      @deck  = Deck.build_deck
    end

  end

end
