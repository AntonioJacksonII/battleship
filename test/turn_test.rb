require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/setup'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new
    assert_instance_of Turn, turn
  end

  def test_display_computer_board
    turn = Turn.new
    turn.setup_game

    assert_equal turn.setup.computer_board.render, turn.display_computer_board
  end

  def test_display_player_board
    turn = Turn.new
    turn.setup_game

    assert_equal turn.setup.player_board.render(true), turn.display_player_board
  end


end
