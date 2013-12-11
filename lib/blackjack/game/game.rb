# encoding: UTF-8
class Game

  @cards
  @discard_pile

  @total_games
  @deck_dealt_times

  @players

  def initialize
    @cards = Deck.build_deck
    @discard_pile = []
    @total_games = 0
    @deck_dealt_times = 0

    #todo: Add a computer player.
    @players = []
    @players.push(BlackJackPlayer.new("Dealer"))
    @players.push(BlackJackPlayer.new("Two"))
  end

  # Go Through each player in the game and deal a black jack game.
  def GameRound
    @players.each do |current_player|
      #todo
    end
    Board.re_draw(@players, nil,  ["hit,stay"])
  end


  def action(act)
    case act
      when :hit
        #add a card
      when :stay
        #skip to next player
    end
  end


end
