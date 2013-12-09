# encoding: UTF-8
require 'colorize'

class FrenchDeck
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

  SUIT = {
    :spade   => "♠",
    :heart   => "♥",
    :diamond => "♦",
    :clove   => "♣"
  }.freeze

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
  attr_accessor :type
  attr_accessor :suit

  def initialize(card_suit, card_type)
    @suit = card_suit
    @type = card_type
  end

  def to_s
    return "#{FrenchDeck.card_face(@type)}#{FrenchDeck::SUIT[@suit]}"
  end

  def value
    return FrenchDeck::TYPE[@type]
  end

  def print
    case @suit
    when :heart, :diamond
      text = "[#{to_s}]".red.on_white
    else
      text = "[#{to_s}]".black.on_white
    end
    text
  end

end