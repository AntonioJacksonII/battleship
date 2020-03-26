require './lib/ship'


class Cell
  attr_reader :coordinate, :ship_cell
  attr_accessor :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship_cell = nil
    @fired_upon = false
  end

  def ship
    @ship_cell
  end

  def empty?
     @ship_cell == nil
  end

  def place_ship(name)
    @ship_cell = (name)
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
      if @ship_cell != nil
          @ship_cell.health -= 1
      end
  end

  def render
    if (@ship_cell != nil) && (@fired_upon == true)
      "H"
    elsif  :ship_cell && (@fired_upon == true)
      "M"
    elsif (@health == 0)
      "X"
    else
      "."
    end
  end

end
