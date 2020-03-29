require './lib/turn'
require './lib/setup'

p 'Welcome to BATTLESHIP'
p 'Enter p to play. Enter q to quit.'

start = gets.chomp

if start == 'p'
  turn = Turn.new
  turn.setup_game
  print turn.display_both_boards
  turn.get_player_shot
  turn.validate_player_shot
  p turn.take_player_shot
  turn.get_computer_shot
  turn.take_computer_shot
elsif start == 'q'
  p 'You have quit the game'
else
  p "You did not enter 'p' or 'q'. Please try again."
end
