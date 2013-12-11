# encoding: UTF-8
class Dealer < BlackJackPlayer
# Handles the extra logic of being a Dealer

  # Initializes a new Dealer
  def initialize(name)
    super(name, :dealer)
  end


  # Super simple logic.
  # Dealer keeps hitting until bust or won the game
  # Hits on hard 17
  #
  # Soft 17 contains ace
  # Hard 17 has no ace
  def should_hit?(player_against)
    score_to_beat = 0

    if blackjack_in_hand?
      blackjack!
      return false
    end

    player_against.each do |p|
      puts p.hand_value
      if p.kind == :human and p.hand_value > score_to_beat and p.hand_value <= 21
        score_to_beat = p.hand_value
      end
    end

    if hand_value < score_to_beat and hand_value <= 17
      return true
    else
      return false
    end
  end

end