require './lib/cell'
require './lib/ship'

class Board

  attr_reader :cells

  def initialize
    @cells = {'A1' => Cell.new('A1'),
              'A2' => Cell.new('A2'),
              'A3' => Cell.new('A3'),
              'A4' => Cell.new('A4'),
              'B1' => Cell.new('B1'),
              'B2' => Cell.new('B2'),
              'B3' => Cell.new('B3'),
              'B4' => Cell.new('B4'),
              'C1' => Cell.new('C1'),
              'C2' => Cell.new('C2'),
              'C3' => Cell.new('C3'),
              'C4' => Cell.new('C4'),
              'D1' => Cell.new('D1'),
              'D2' => Cell.new('D2'),
              'D3' => Cell.new('D3'),
              'D4' => Cell.new('D4')}
  end

  def valid_coordinate?(coordinate)
    cells.keys.any?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    no_ship_overlap(coordinates) &&
    coordinates_match_ship_length?(ship, coordinates) &&
    coordinates_are_consecutive?(coordinates)
  end

  def no_ship_overlap(coordinates)
    coordinates.map do |coordinate|
    @cells[coordinate].ship == nil
    end.all?
  end

  def coordinates_match_ship_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def coordinates_are_consecutive?(coordinates)
    split_coordinates = coordinates.map do |coordinate|
      coordinate.split("")
    end
    if split_coordinates.all?{ |coordinates| coordinates[0] == split_coordinates[0][0]}
      split_coordinates.each_cons(2).all? { |x,y| y[1].to_i == x[1].to_i + 1 }
    elsif split_coordinates.all?{ |coordinates| coordinates[1] == split_coordinates[0][1]}
      split_coordinates.each_cons(2).all? { |x,y| y[0].ord == x[0].ord + 1 }
    else
        false
    end
  end

  def place(ship, cells)
    cells.each do
      |cell| @cells[cell].place_ship(ship)
    end
  end





end
