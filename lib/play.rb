require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/battleship_runner'

class Play

@board = Board.new

  def computer_ship_placement

    computer_cruiser = Ship.new("Computer Cruiser", 3)
    computer_sub = Ship.new("Computer Submarine", 2)

    place_ship(computer_cruiser)
    place_ship(computer_sub)
  end

  def place_ship(ship)
    placement = []
    until @board.valid_placement?(ship, placement) do
      placement = @board.cells.keys.sample(ship.length)
    end
    @board.place(ship, placement)
  end

  p "I have laid out my ships on the grid."
  p "You now need to lay out your two ships."
  p "The Cruiser is three units long and the Submarine is two units long."
  p @board

  def player_ship_placement
    #require "pry"; binding.pry
    #p "I have laid out my ships on the grid."
    #p "You now need to lay out your two ships."
    #p "The Cruiser is three units long and the Submarine is two units long."

     if @board.valid_placement?(@cruiser, gets.chomp)
      ship_input = @board.cells.keys.sample(ship.length)
    elsif @board.valid_placement?(@submarine, gets.chomp)
      ship_input = @board.cells.keys.sample(ship.length)
  end

#gets.chomp.player_ship_placement

    end


print @board.render

end

#Play.new.player_ship_placement
