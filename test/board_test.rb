require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.length
    assert_instance_of Cell, @board.cells.values[0]
    assert_instance_of Cell, @board.cells.values[15]
  end

  def test_valid_coordinate?
    assert_equal true, @board.valid_coordinate?('A1')
    assert_equal true, @board.valid_coordinate?('D4')
    assert_equal false, @board.valid_coordinate?('A5')
    assert_equal false, @board.valid_coordinate?('E1')
    assert_equal false, @board.valid_coordinate?('A22')
  end

  def test_coordinates_match_ship_length?
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(@cruiser, ['D1', 'D2', 'D3'])
    assert_equal true, @board.valid_placement?(@submarine, ['A1', 'A2'])
  end

  def test_coordinates_are_consecutive?
    assert_equal false, @board.coordinates_are_consecutive?(["A1", "A2", "A4"])
    assert_equal false, @board.coordinates_are_consecutive?(["A1", "C1"])
    assert_equal false, @board.coordinates_are_consecutive?(["A3", "A2", "A1"])
    assert_equal false, @board.coordinates_are_consecutive?(["C1", "B1"])
  end

  def test_coordinates_are_not_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_valid_placement?
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser,["A3", "A2", "A1"])
  end

  def test_place
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal @cruiser, @board.cells["A1"].ship
    assert_equal @cruiser, @board.cells["A2"].ship
    assert_equal @cruiser, @board.cells["A3"].ship
    assert_nil @board.cells["A4"].ship
  end

  def test_ship_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_render
    board = Board.new
    assert_equal "\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render

    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    assert_equal "\n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", board.render
    assert_equal "\n  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", board.render(true)
  end
end
