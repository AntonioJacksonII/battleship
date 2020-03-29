require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/setup'
require './lib/ship'

class TurnTest < Minitest::Test

  def test_it_exists
    skip
    turn = Turn.new
    assert_instance_of Turn, turn
  end

  def test_display_computer_board
    skip
    turn = Turn.new
    turn.setup_game

    assert_equal turn.setup.computer_board.render, turn.display_computer_board
  end

  def test_display_player_board
    skip
    turn = Turn.new
    turn.setup_game

    assert_equal turn.setup.player_board.render(true), turn.display_player_board
  end

  def test_display_both_boards
    skip
    turn = Turn.new
    turn.setup_game

    assert_equal (print "=============COMPUTER BOARD=============\n#{turn.display_computer_board}\n==============PLAYER BOARD==============\n#{turn.display_player_board}"), turn.display_both_boards
  end

  def test_get_player_shot
    skip
    turn = Turn.new
    turn.setup_game

    assert_nil turn.player_shot
    #Enter 'A1' when prompted for a shot
    assert_equal "A1", turn.get_player_shot
    assert turn.player_shot
  end

  def test_validate_player_shot
    skip
    turn = Turn.new
    turn.setup_game
    turn.get_player_shot
    turn.validate_player_shot

    assert_equal true, turn.setup.computer_board.valid_coordinate?(turn.player_shot)
  end

  def test_get_computer_shot
    skip
    turn = Turn.new
    turn.setup_game
    turn.get_computer_shot

    assert_equal true, turn.setup.player_board.valid_coordinate?(turn.computer_shot)
    assert_equal false, turn.setup.player_board.cells[turn.computer_shot].fired_upon?
  end

  def test_take_player_shot_miss
    skip
    turn = Turn.new
    turn.setup_game
    turn.get_player_shot
    turn.validate_player_shot

    assert_equal "Your shot on #{turn.player_shot} was a miss.", turn.take_player_shot
    assert_equal true, turn.setup.computer_board.cells[turn.player_shot].fired_upon?
  end

  def test_take_player_shot_hit_and_sunk
    skip
    turn = Turn.new
    turn.setup_game
    computer_submarine = Ship.new("Submarine", 2)
    turn.setup.computer_board.place(computer_submarine, ["A1", "A2"])

    #Enter "A1" as player shot
    turn.get_player_shot

    assert_equal "Your shot on #{turn.player_shot} hit the Submarine.", turn.take_player_shot
    assert_equal true, turn.setup.computer_board.cells[turn.player_shot].fired_upon?

    #Enter "A2" as player shot
    turn.get_player_shot
    assert_equal "Your shot on #{turn.player_shot} sunk the Submarine.", turn.take_player_shot
    assert_equal true, turn.setup.computer_board.cells[turn.player_shot].fired_upon?
  end

  def test_take_computer_shot
    turn = Turn.new
    turn.setup_game
    turn.get_computer_shot

    assert_equal true, turn.setup.player_board.cells[turn.computer_shot].fired_upon?
  end

end
