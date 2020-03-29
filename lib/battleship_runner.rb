require './lib/play'

p 'Welcome to BATTLESHIP'
p 'Enter p to play. Enter q to quit.'

start = gets.chomp

if start == 'p'
  turn = Turn.new
  turn.setup_game
  print turn.display_computer_board
elsif start == 'q'
  p 'You have quit the game'
else
  p "You did not enter 'p' or 'q'. Please try again."
end
