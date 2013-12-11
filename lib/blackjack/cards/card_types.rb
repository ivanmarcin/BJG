# encoding: UTF-8
require 'colorize'

class FrenchDeck
# Representation of a 52 poker/blackjack card deck.

  # Numeric Type
  TYPE = {
    :ace    => 1,
    :two    => 2,
    :three  => 3,
    :four   => 4,
    :five   => 5,
    :six    => 6,
    :seven  => 7,
    :eight  => 8,
    :nine   => 9,
    :ten    => 10,
    :jack   => 11,
    :queen  => 12,
    :king   => 13
  }.freeze

  # Figure
  SUIT = {
    :spade   => "♠",
    :heart   => "♥",
    :diamond => "♦",
    :clove   => "♣"
  }.freeze

  # Returns the value as it would appear visually on a french deck card
  # i.e: J or a Jack card.
  def self.card_face(card_type)
    case TYPE[card_type]
    when 2..10
      TYPE[card_type]
    when 1
      "A"
    when 11
      "J"
    when 12
      "Q"
    when 13
      "K"
    end
  end

end

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