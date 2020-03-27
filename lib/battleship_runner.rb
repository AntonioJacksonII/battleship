p 'Welcome to BATTLESHIP'
p 'Enter p to play. Enter q to quit.'

start = gets.chomp

if start == 'p'
  play
elsif start == 'q'
  p 'You have quit the game'
else
  p "You did not enter 'p' or 'q'. Please try again."
end
