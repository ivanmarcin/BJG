class BlackJackPlayer < Player
  # key value pairs.
  # each pair is key: Card object, Value: boolean representing visibility
  attr_accessor :cards_in_hand

  def initialize(name)
    super(name)
    @cards_in_hand = {}
  end

  def add_card(card, hidden = false)
    # player can only have one hidden card in the game
    if hidden
      @cards_in_hand.keys.each do |card|
        @cards_in_hand[card] = false
      end
    end

    @cards_in_hand[card] = hidden
  end

  # Sum of card numeric values
  # If there's an ace. Will see if flipping its value from 1 to 11 brings the deck closer to 21.
  # counting 2(or more) aces as 11 won't work here as the deck goes over to 22.
  def hand_value
    hand_value = 0
    has_ace = false

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
      pair.push  @cards_in_hand.keys.first.type
      pair.push  @cards_in_hand.keys.last.type

      if pair.include?(:ace) and [:jack, :king, :queen].any? { |i| pair.include?(i) }
        blackjack = true
      end
    end
    blackjack
  end
end
