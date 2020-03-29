require 'minitest/autorun'
require 'minitest/pride'
require './lib/play'
require './lib/ship'
require './lib/board'
require './lib/cell'

class PlayTest < Minitest::Test

  def test_it_exists
    play = Play.new
    assert_instance_of Play, play
  end

  def test_computer_ship_placement
    play = Play.new
    play.computer_ship_placement

    assert_equal 5, (play.computer_board.cells.select{ |key, value| value.ship_cell != nil}.length)
  end

  def test_place_ship_computer_cruiser
    play = Play.new
    play.computer_ship_placement
    computer_cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, play.place_ship(computer_cruiser).length
    assert_equal computer_cruiser, play.computer_board.cells[play.place_ship(computer_cruiser)[0]].ship
    assert_equal computer_cruiser, play.computer_board.cells[play.place_ship(computer_cruiser)[2]].ship
  end

  def test_place_ship_computer_sub
    play = Play.new
    play.computer_ship_placement
    computer_sub = Ship.new("Submarine", 2)

    assert_equal 2, play.place_ship(computer_sub).length
    assert_equal computer_sub, play.computer_board.cells[play.place_ship(computer_sub)[0]].ship
    assert_equal computer_sub, play.computer_board.cells[play.place_ship(computer_sub)[1]].ship
  end

  def test_player_instructions
    play = Play.new
    play.player_instructions

    assert_equal 5, (play.player_board.cells.select{ |key, value| value.ship_cell != nil}.length)
  end

  def test_place_player_cruiser
    play = Play.new
    play.player_instructions
    play.place_player_cruiser(["A1", "A2", "A3"])

    refute nil, play.player_board.cells["A1"].ship
    refute nil, play.player_board.cells["A2"].ship
    refute nil, play.player_board.cells["A3"].ship
    assert_nil play.player_board.cells["A4"].ship
    assert_nil play.player_board.cells["B1"].ship
    assert_nil play.player_board.cells["C2"].ship
    assert_nil play.player_board.cells["D3"].ship
  end

  def test_place_player_submarine
    play = Play.new
    play.player_instructions
    play.place_player_submarine(["A1", "A2"])

    refute nil, play.player_board.cells["A1"].ship
    refute nil, play.player_board.cells["A2"].ship
    assert_nil play.player_board.cells["A3"].ship
    assert_nil play.player_board.cells["B1"].ship
    assert_nil play.player_board.cells["C2"].ship
    assert_nil play.player_board.cells["D3"].ship
  end


end
