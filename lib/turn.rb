class Turn

  attr_reader :setup

  def setup_game
    @setup = Setup.new
    @setup.computer_ship_placement
    @setup.player_ship_placement
  end

  def display_computer_board
    @setup.computer_board.render
  end

  def display_player_board
    @setup.player_board.render(true)
  end

  def display_both_boards
    print "=============COMPUTER BOARD============="
    print display_computer_board
    print "==============PLAYER BOARD=============="
    print display_player_board
  end
end
