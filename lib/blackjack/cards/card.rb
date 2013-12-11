# encoding: UTF-8
require 'colorize'

class Card
# Container for a game card and helper methods.
  attr_accessor :type
  attr_accessor :suit

  # card_suit: shape of card:
  # card_type: numerical value
  def initialize(card_suit, card_type)
    @suit = card_suit[0]
    @type = card_type[0]
  end

  # Returns the printed notation of a card
  # i.e. 2 of diamonds: 2♦
  def to_s
    return "#{FrenchDeck.card_face(@type)}#{FrenchDeck::SUIT[@suit]}"
  end

  # Easy accesor to the value of the card
  def value
    return FrenchDeck::TYPE[@type]
  end

  # Helper to return the text representation of the card in the respective color
  def print
    case @suit
    when :heart, :diamond
      text = "[#{to_s}]".red.on_white
    else
      text = "[#{to_s}]".black.on_white
    end
  end

end