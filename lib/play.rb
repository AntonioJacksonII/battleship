require './lib/board'
require './lib/ship'

class Play

  def computer_ship_placement
    @board = Board.new
    computer_cruiser = Ship.new("Computer Cruiser", 3)
    computer_sub = Ship.new("Computer Submarine", 2)
    place_ship(computer_cruiser)
    place_ship(computer_sub)
    require "pry"; binding.pry
  end

  def place_ship(ship)
    placement = []
    until @board.valid_placement?(ship, placement) do
      placement = @board.cells.keys.sample(ship.length)
    end
    @board.place(ship, placement)
  end


end

Play.new.computer_ship_placement
