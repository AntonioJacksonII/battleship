require './lib/play'
require './lib/board'
require './lib/ship'
require './lib/cell'

p 'Welcome to BATTLESHIP'
p 'Enter p to play. Enter q to quit.'

start = gets.chomp.split(" ")

if start == 'p'
elsif start == 'q'
  p 'You have quit the game'
else
  p "You did not enter 'p' or 'q'. Please try again."
end

p 'I have laid out my ships on the grid.'

p 'You now need to lay out your two ships.'

p 'The Cruiser is three units long and the Submarine is two units long.'

gets.chomp.split(" ").player_ship_placement
