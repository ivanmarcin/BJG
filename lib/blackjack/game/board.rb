# encoding: UTF-8
class Board
# Graphic helper methods to display the game board


  ####################################################################
  # Interactive methods
  ####################################################################


  # Drawing routine.
  # Receives a game state, and draws the board.
  def self.re_draw(players, action_list = nil, winners = false, game_stats = nil)
    clear_screen
    print_header
    print_separator

    players.each do |p|
      print_player(p)
    end

    print_separator

    print_winner_list(winners) if winners

    ask_action(action_list) if action_list
  end

   # Displays a list of actions to the user, and returns the user's selected action
  # as a char, being the first letter of the action typed by the user.
  def self.ask_action(action_list = nil)
    if action_list
      action_bar = "Action? (Type key followed by enter)\t".blue
      action_list.each do |action|
        action_bar += " - [#{action[0]}]".green + action[1..-1]
      end

      puts action_bar

      output = STDIN.gets

      return output.capitalize[0]
    end

    return nil
  end


  ####################################################################
  # Screen printing
  ####################################################################


  # Prints a player's data and current card deck.
  def self.print_player(player)
    hidding     = false
    player_deck = ""

    player.cards_in_hand.keys.each do |card|
      if player.cards_in_hand[card] #hidden
        player_deck += "[░░]".black.on_white
        hidding = true
      else
        player_deck += card.print
      end
    end

    puts print_avatar(player)
    puts " Card Total: #{player.hand_value}".cyan unless hidding
    puts "\t\t #{player_deck} \n\n"

    print_board_logo if player.kind == :dealer
  end

  # Helper to print percent of many games a player won
  def self.print_win_ratio_in_percent(player)
    "\t\t=> Percent of Games Won: #{player.win_ratio_in_percent}%".green
  end

  # Prints a colored line
  def self.print_separator
    separator = "=-_-=" * 15
    puts separator.yellow + "\n"
  end

  # Pretty prints the winner list
  def self.print_winner_list(winners)
    puts " **!!!! #{winners.join(' and ')} wins this round!".magenta
  end

  # clears the display to ready it for a redraw.
  # this works on linux/osx only
  def self.clear_screen
    system('clear')
  end


  ####################################################################
  # Ascii drawing methods
  ####################################################################


  def self.print_avatar(player)
    avt = ""
    case player.kind
      when :human
        avt = player_avatar
      when :dealer
        avt = dealer_avatar
    end

    avt + "*".yellow + "  #{player.name} #{print_win_ratio_in_percent(player)} \t\t\t".magenta
  end

  # Player Character drawing
  def self.player_avatar
    return "(゜_゜)".cyan
  end

  # Dealer Character drawing
  def self.dealer_avatar
    return "(ﾉ◕".cyan+"ヮ".blue+"◕)-☆".cyan
  end

  # Awesomeness generated by http://www.network-science.de/ascii/
  def self.print_header
    puts "|    |              |        o          |    ".light_green
    puts "|---.|    ,---.,---.|__/     .,---.,---.|__/ ".light_green
    puts "|   ||    ,---||    |  \\     |,---||    |  \\ ".green
    puts "`---'`---'`---^`---'`   `    |`---^`---'`   `".green
    puts "                         `---'               ".yellow
  end

  def self.print_board_logo
    puts "\n\t\t         /    \\ ".yellow
    puts "\t\t   ==== | =BJ= | ====".light_green
    puts "\t\t         \\    /  \n\n".yellow
  end

end
