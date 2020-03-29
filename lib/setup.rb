require './lib/board'
require './lib/ship'

class Setup

  attr_reader :computer_board, :player_board

  def computer_ship_placement
    @computer_board = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_sub = Ship.new("Submarine", 2)
    place_computer_ship(computer_cruiser)
    place_computer_ship(computer_sub)
  end

  def place_computer_ship(ship)
    placement = []
    until @computer_board.valid_placement?(ship, placement) do
      placement = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, placement)
  end

  def player_ship_placement
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
