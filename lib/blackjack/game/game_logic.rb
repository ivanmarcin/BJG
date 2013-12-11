# encoding: UTF-8
class GameLogic
# Game logic methods

  @games_before_shuffle = 6

  attr_accessor :game_number
  attr_accessor :card_deck
  attr_accessor :discard_pile

  def initialize
    @cards = Deck.build_deck
    @discard_pile = []
    @total_games = 0
    @deck_dealt_times = 0
  end

  # Go Through each player in the game and deal a black jack game.
  def GameRound(players)
    shuffle_deck!
    deal_initial_cards(players)

    players.each do |current_player|
      if player.blackjack_in_hand?
        @player.blackjack!
        continue
      end

      case player.kind
        when :dealer
              #auto play
        when :human
          while player.hand_value < 21
            action_handler(player)
          end
      end

      pick_winner
      update_stats
    end
  end

  # Reshuffle after 6 games OR if remaining stack is less than 15
  # so the game doesn't run out of cards.
  def shuffle_deck!
    if @game_number % @games_before_shuffle == 0 or @cards.count < 15
      @card_deck = Deck.shuffle(Deck.build_deck)
    end
  end

  #give 2 start cards to each player
  def deal_initial_cards(players)
    if player.kind == :dealer
      add_card(@card_deck.pop, true)
      add_card(@card_deck.pop, true)
    else
      add_card(@card_deck.pop, true)
      add_card(@card_deck.pop, false)
    end
  end

  # Game action
  def action_handler(player)
    case act
      when :hit
        #add a card
      when :stay
        #skip to next player
    end
  end

  # choose whoever won the round
  def pick_winner
  end

  # update game win/loss ratio stats
  def update_stats
  end

end
