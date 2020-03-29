require 'minitest/autorun'
require 'minitest/pride'
require './lib/setup'
require './lib/ship'
require './lib/board'
require './lib/cell'

class SetupTest < Minitest::Test

  def test_it_exists
    setup = Setup.new
    assert_instance_of Setup, setup
  end

  def test_computer_ship_placement
    setup = Setup.new
    setup.computer_ship_placement

    assert_equal 5, (setup.computer_board.cells.select{ |key, value| value.ship_cell != nil}.length)
  end

  def test_place_ship_computer_cruiser
    setup = Setup.new
    setup.computer_ship_placement
    computer_cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, setup.place_ship(computer_cruiser).length
    assert_equal computer_cruiser, setup.computer_board.cells[setup.place_ship(computer_cruiser)[0]].ship
  end

  def test_place_ship_computer_sub
    setup = Setup.new
    setup.computer_ship_placement
    computer_sub = Ship.new("Submarine", 2)

    assert_equal 2, setup.place_ship(computer_sub).length
    assert_equal computer_sub, setup.computer_board.cells[setup.place_ship(computer_sub)[0]].ship
    assert_equal computer_sub, setup.computer_board.cells[setup.place_ship(computer_sub)[1]].ship
  end

  def test_player_instructions
    setup = Setup.new
    setup.player_instructions

    assert_equal 5, (setup.player_board.cells.select{ |key, value| value.ship_cell != nil}.length)
  end

  def test_place_player_cruiser
    setup = Setup.new
    setup.player_instructions
    setup.place_player_cruiser(["A1", "A2", "A3"])

    refute nil, setup.player_board.cells["A1"].ship
    refute nil, setup.player_board.cells["A2"].ship
    refute nil, setup.player_board.cells["A3"].ship
    assert_nil setup.player_board.cells["A4"].ship
    assert_nil setup.player_board.cells["B1"].ship
    assert_nil setup.player_board.cells["C2"].ship
    assert_nil setup.player_board.cells["D3"].ship
  end

  def test_place_player_submarine
    setup = Setup.new
    setup.player_instructions
    setup.place_player_submarine(["A1", "A2"])

    refute nil, setup.player_board.cells["A1"].ship
    refute nil, setup.player_board.cells["A2"].ship
    assert_nil setup.player_board.cells["A3"].ship
    assert_nil setup.player_board.cells["B1"].ship
    assert_nil setup.player_board.cells["C2"].ship
    assert_nil setup.player_board.cells["D3"].ship
  end


end
