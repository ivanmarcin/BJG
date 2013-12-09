# encoding: UTF-8
class Game

  @cards
  @discard_pile

  @total_games
  @deck_dealt_times

  @players = {}

  def initialize
    @cards = Deck.build_deck
    @discard_pile = []
    @total_games = 0
    @deck_dealt_times = 0

    #todo: Add a computer player.
    #todo: reverse card [░░]
    @players.push(BlackJackPlayer.new("One"))
    @players.push(BlackJackPlayer.new("Two"))
  end

  # Go Through each player in the game and deal a black jack game.
  def GameRound
    #todo
  end

end
