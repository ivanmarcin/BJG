# encoding: UTF-8
class GameLogic
# Game logic methods

  attr_accessor :player_list
  attr_accessor :game_number
  attr_accessor :card_deck
  attr_accessor :games_before_shuffle

  def initialize(players)
    @game_number  = 0
    @player_list  = players
    @card_deck    = Deck.build_deck
    @games_before_shuffle = 6
  end

  # Go Through each player in the game and deal a black jack game.
  def game_round
    begin
      @game_number+=1
      shuffle_deck!
      deal_initial_cards(@player_list)
      do_player_turns
      update_stats(pick_winner)
    end while player_wants_to_continue
  end

  # Ask the player if another round should be dealt
  def player_wants_to_continue
    response = Board.re_draw(@player_list,["Quit", "Continue"], pick_winner)

    if response == 'C'
      return true
    elsif response == 'Q'
      return false
    else
      player_wants_to_continue
    end
  end

  # Iterate each player's turns
  def do_player_turns
    last_action = nil

    @player_list.reverse.each do |current_player|
      if current_player.blackjack_in_hand?
        current_player.blackjack!
        next
      end

      Board.re_draw(@player_list)

      case current_player.kind
        when :dealer
          dealer_handler(current_player)
        when :human
          while current_player.hand_value < 21 and last_action != :stay
            last_action = action_handler(current_player)
          end
      end

    end
  end

  # Reshuffle after 6 games OR if remaining stack is less than 15
  # so the game doesn't run out of cards.
  def shuffle_deck!
    if @game_number % @games_before_shuffle == 1 or @card_deck.count < 15
      @card_deck = Deck.shuffle(Deck.build_deck)
    end
  end

  #give 2 start cards to each player
  def deal_initial_cards(players)
    players.each do |p|

      p.clear_cards

      if p.kind == :dealer
        p.add_card(@card_deck.pop, true) #first card from dealer is hidden :)
        p.add_card(@card_deck.pop, false)
      else
        p.add_card(@card_deck.pop, false)
        p.add_card(@card_deck.pop, false)
      end

    end
  end

  # Game action
  def action_handler(player)

    puts "dealing with #{player.name}"
    response = Board.re_draw(@player_list,["Hit", "Stay"])
    case response
      when 'H'
        player.add_card(@card_deck.pop, false)
      when 'S'
        return :stay
      else
        #iterate again
        action_handler(player)
    end
  end

  #deals with the turn of the dealer
  def dealer_handler(dealer)
    dealer.reveal_deck
    Board.re_draw(@player_list)

    while dealer.should_hit?(@player_list)
      sleep(1)
      dealer.add_card(@card_deck.pop)
      Board.re_draw(@player_list)
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
        max_score = p.hand_value
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
  def update_stats(winners)
    @player_list.each do |player|
      player.games_played +=1
      if winners.include? player.name
        player.games_won += 1
      end
    end
  end

end