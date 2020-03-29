require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/battleship_runner'

class Play

@board = Board.new

  def computer_ship_placement
<<<<<<< HEAD

    computer_cruiser = Ship.new("Computer Cruiser", 3)
    computer_sub = Ship.new("Computer Submarine", 2)

=======
    @computer_board = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_sub = Ship.new("Submarine", 2)
>>>>>>> 7a0a5b5cf7a571c95b5ff457e050322c983e73c5
    place_ship(computer_cruiser)
    place_ship(computer_sub)
  end

  def place_ship(ship)
    placement = []
    until @computer_board.valid_placement?(ship, placement) do
      placement = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, placement)
  end

<<<<<<< HEAD
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
=======
  def player_instructions
    @player_board = Board.new
    p 'I have laid out my ships on the grid.'
    p 'You now need to lay out your two ships.'
    p 'The Cruiser is three units long and the Submarine is two units long.'
    print @player_board.render
    p 'Enter the squares for the Cruiser (3 spaces):  '
    input_coordinates = gets.chomp.split(" ")
    place_player_cruiser(input_coordinates)
    p 'Enter the squares for the Submarine (2 spaces): '
    input_coordinates = gets.chomp.split(" ")
    place_player_submarine(input_coordinates)
  end

  def place_player_cruiser(coordinates)
    player_cruiser = Ship.new("Cruiser", 3)
    until @player_board.valid_placement?(player_cruiser, coordinates) do
      p 'Those are invalid coordinates. Please try again: '
      coordinates = gets.chomp.split(" ")
    end
    @player_board.place(player_cruiser, coordinates)
  end

  def place_player_submarine(coordinates)
    player_submarine = Ship.new("Submarine", 2)
    until @player_board.valid_placement?(player_submarine, coordinates) do
      p 'Those are invalid coordinates. Please try again: '
      coordinates = gets.chomp.split(" ")
    end
    @player_board.place(player_submarine, coordinates)
  end

end

@play = Play.new
@play.computer_ship_placement
@play.player_instructions
>>>>>>> 7a0a5b5cf7a571c95b5ff457e050322c983e73c5
