require './lib/turn'
require './lib/setup'

def main_menu
  @start = ""
  p 'Welcome to BATTLESHIP'
  p 'Enter p to play. Enter q to quit.'
  @start = gets.chomp

  if @start == 'p'
    turn = Turn.new
    turn.setup_game
    p turn.determine_winner
    main_menu
  elsif @start == 'q'
    p 'You have quit the game'
  else
    p "You did not enter 'p' or 'q'. Please try again."
  end
end

main_menu
