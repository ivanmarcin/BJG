# encoding: UTF-8
class FrenchDeck
  TYPE = {
    1  => :ace,
    2  => :two,
    3  => :three,
    4  => :four,
    5  => :five,
    6  => :six,
    7  => :seven,
    8  => :eight,
    9  => :nine,
    10 => :ten,
    11 => :jack,
    12 => :queen,
    13 => :king
  }.freeze

  SUIT = {
    :spade   => "♠",
    :heart   => "♥",
    :diamond => "♦",
    :clove   => "♣"
  }.freeze
end

class Card
  attr_accessor :type
  attr_accessor :suit

  def initialize(card_suit, card_type)
    @suit = card_suit
    @type = card_type
  end
end