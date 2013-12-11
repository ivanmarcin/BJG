# encoding: UTF-8
class Deck
# Represents a game deck containing 52 cards.
# plus helper methods to handle the deck.

  # Creates a new ordered deck. 52 card deck of cards. 1 per suite
  def self.build_deck
    deck = []
    FrenchDeck::SUIT.each do |suit|
      FrenchDeck::TYPE.each do |type|
        deck.push( Card.new(suit, type))
      end
    end
    deck
  end

  # Returns a copy of a random shuffled deck.
  def self.shuffle(deck)
    deck.shuffle(random: Random.new(Time.now.to_i))
  end
end
