# encoding: UTF-8
class Board
# Graphic helper methods to display the game board
# Sample:
# Game Round: 25
# =============================
#   Dealer    [Wins: 0]
#   [░] [░]

#   Player 1  [Win Ratio: 43.2%]
#   [░] [A*] [K*] [??]

# *// Player Hits     ->display wait 500ms. Display new card -> wait 500 ms -> erase
# =============================
# [H]it or [S]tay? Type H or S.
# [O]pen or [C]losed card? Type O or C

  # Drawing routine.
  # Receives a game state, and draws the board.
  def self.re_draw(players, game_stats = nil, action_list = nil)
    clear_screen

    print_header
    print_separator

    players.each do |p|
      print_player(p)
    end

    print_separator

    if action_list
      ask_action(action_list)
    end
  end

  # Awesomeness generated by http://www.network-science.de/ascii/
  def self.print_header
    puts "|    |              |        o          |    ".light_green
    puts "|---.|    ,---.,---.|__/     .,---.,---.|__/ ".light_green
    puts "|   ||    ,---||    |  \\     |,---||    |  \\ ".green
    puts "`---'`---'`---^`---'`   `    |`---^`---'`   `".green
    puts "                         `---'               ".yellow
  end

  #prints a player's data and current card deck.
  def self.print_player(player)
    puts  "*".yellow + "\t #{player.name} \t\t\t".blue + "[ Win Ratio:]"

    player_deck = "\t"
    player.cards_in_hand.keys.each do |card|
      if player.cards_in_hand[card]
        player_deck += "[░░]".black.on_white
      else
        player_deck += card.print
      end
    end
    puts player_deck
  end

  # prints a colored line
  def self.print_separator
    puts '======================================='.yellow
  end

  # Displays a list of actions to the user, and returns the user's selected action
  # as a char, being the first letter of the action typed by the user.
  def self.ask_action(action_list)
    action_bar = "Action? (Type key followed by enter)\t".blue
    action_list.each do |action|
      action_bar += " - [#{action[0]}]".green + action[1..-1]
    end
    output = gets

    return output.capitalize[0]
  end

  # clears the display to ready it for a redraw.
  # this works on linux/osx only
  def self.clear_screen
    system('clear')
  end

end
