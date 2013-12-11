# encoding: UTF-8
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