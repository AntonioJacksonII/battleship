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
end
