# encoding: UTF-8
class Player
# Generic player methods.
  attr_accessor :name

  # Creates a new player, initializes it's name.
  def initialize(name)
    @name = name
  end
end
