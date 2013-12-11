# encoding: UTF-8
class GameLogic
# Game logic methods

  attr_accessor :player_list
  attr_accessor :game_number
  attr_accessor :card_deck
  attr_accessor :discard_pile
  attr_accessor :games_before_shuffle

  def initialize(players)
    @discard_pile = []
    @game_number  = 0
    @player_list  = players
    @card_deck    = Deck.build_deck
    @games_before_shuffle = 6
  end

  # Go Through each player in the game and deal a black jack game.
  def game_round

    shuffle_deck!

    deal_initial_cards(@player_list)

    @player_list.each do |current_player|
      if current_player.blackjack_in_hand?
        current_player.blackjack!
        continue
      end

      Board.re_draw(@player_list)

      case current_player.kind
        when :dealer
              #auto play
        when :human
          while current_player.hand_value < 21
            action_handler(current_player)
          end
      end

      Board.print_winner_list(pick_winner)

      update_stats
    end
  end

  # Reshuffle after 6 games OR if remaining stack is less than 15
  # so the game doesn't run out of cards.
  def shuffle_deck!
    if @game_number % @games_before_shuffle == 0 or @card_deck.count < 15
      @card_deck = Deck.shuffle(Deck.build_deck)
    end
  end

  #give 2 start cards to each player
  def deal_initial_cards(players)
    players.each do |p|
      p.clear_cards

      if p.kind == :dealer
        p.add_card(@card_deck.pop, true)
        p.add_card(@card_deck.pop, true)
      else
        p.add_card(@card_deck.pop, true)
        p.add_card(@card_deck.pop, false)
      end

    end
  end

  # Game action
  def action_handler(player)

    response = Board.re_draw(@player_list,["Hit", "Stay"])
    case response
      when 'H'
        player.add_card(@card_deck.pop, false)
      when 'S'
        return
      else
        #iterate again
        action_handler(player)
    end
  end

  # Logic to picking a winner
  # Since there is no betting:
  #   If somebody on the table has blackjack, they are the winners
  #   Otherwise. whomever gets the top score wins.
  #   Note: According to casino rules online => Blackjack beats 21
  def pick_winner
    max_score    = 0
    winners      = []
    blackjackers = []

    @player_list.each do |p|
      if p.blackjack_in_hand?
        blackjackers.push(p.name)
      elsif p.hand_value == max_score
        winners.push(p.name)
      elsif p.hand_value > max_score and p.hand_value <= 21
        winners = []
        winners.push(p.name)
      end
    end

    #choose the winner!
    if blackjackers.count > 0
      return blackjackers
    else
      return winners
    end
  end

  # update game win/loss ratio stats
  def update_stats
  end

end
