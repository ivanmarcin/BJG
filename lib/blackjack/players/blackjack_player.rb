# encoding: UTF-8
class BlackJackPlayer < Player
# Represents a game player with the logic for a Black Jack game

  # key value pairs.
  # k/v pairs for: Card object, Value: boolean representing visibility
  attr_accessor :cards_in_hand

  # New player with no cards in hand.
  # Requires name of the player
  def initialize(name, kind = :human)
    super(name, kind)
    clear_cards
  end

  # Empty the players cards
  def clear_cards
    @cards_in_hand = {}
  end

  # Adds a card to the players deck.
  # hidden is a flag to display the card as not visible to the players
  # representing a facing down card.
  def add_card(card, hidden = false)
    @cards_in_hand[card] = hidden
  end

  # Sum of card numeric values
  # If there's an ace. Will see if flipping its value from 1 to 11 brings the deck closer to 21.
  # counting 2(or more) aces as 11 won't work here as the deck goes over to 22.
  def hand_value
    hand_value = 0
    has_ace    = false

    @cards_in_hand.keys.each do |c|
      case c.type
      when :ace
        has_ace = true
        hand_value += 1
      when :king, :queen, :jack
        hand_value += 10
      else
        hand_value += c.value
      end
    end

    if has_ace and (hand_value + 10) <= 21
      hand_value += 10
    end
    hand_value
  end

  # Checks if the hand contains a blackjack
  # which is a combo of 2 cards: Ace plus a figure
  def blackjack_in_hand?
    blackjack = false
    if @cards_in_hand.count == 2
      pair = []
      pair.push @cards_in_hand.keys.first.type
      pair.push @cards_in_hand.keys.last.type

      if pair.include?(:ace) and [:jack, :king, :queen].any? { |i| pair.include?(i) }
        blackjack = true
      end
    end
    blackjack
  end

  def reveal_deck
    @cards_in_hand.keys.each do |c|
      @cards_in_hand[c] = false
    end
  end

  # Flip visibility of all cards on black jack
  def blackjack!
    @cards_in_hand.keys do |c|
      @cards_in_hand[c] = false
    end
  end
end