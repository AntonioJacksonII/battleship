require './lib/play'

p 'Welcome to BATTLESHIP'
p 'Enter p to play. Enter q to quit.'

start = gets.chomp

if start == 'p'
  @play = Play.new
  @play.computer_ship_placement
  p 'I have laid out my ships on the grid.'
  p 'You now need to lay out your two ships.'
  p 'The Cruiser is three units long and the Submarine is two units long.'
  @play.player_ship_placement
elsif start == 'q'
  p 'You have quit the game'
else
  p "You did not enter 'p' or 'q'. Please try again."
end
