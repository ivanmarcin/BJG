# encoding: UTF-8
class Player
# Base abstraction for a game player

  #Kinds of Player
  KIND =
  {
    :dealer => 0,
    :player => 1
  }

# Generic player methods.
  attr_accessor :name
  attr_accessor :kind
  attr_accessor :games_won
  attr_accessor :games_played

  # Creates a new player, initializes it's name.
  def initialize(name, kind = :player)
    @name = name
    @kind = kind
    @games_won    = 0
    @games_played = 0
  end

  # Returns the percent of games won by this player
  def win_ratio_in_percent
    win_ratio = @games_won.to_f / @games_played.to_f
    return win_ratio * 100
  end

end
