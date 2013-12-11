# encoding: UTF-8
class Player

  #Kinds of Player
  KIND =
  {
    :dealer => 0,
    :player => 1
  }

# Generic player methods.
  attr_accessor :name
  attr_accessor :kind

  # Creates a new player, initializes it's name.
  def initialize(name, kind = :player)
    @name = name
    @kind = kind
  end
end
