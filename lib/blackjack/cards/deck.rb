# encoding: UTF-8
class Deck

  # 52 card deck of cards. 1 per suite
  def self.build_deck
    deck = []
    FrenchDeck::SUIT.each do |suit|
      FrenchDeck::TYPE.each do |type|
        deck.push( Card.new(suit, type))
      end
    end
    deck
  end

  # Return a random shuffled deck.
  def self.shuffle(deck)
    deck.shuffle(Time.now.to_i)
  end
end
