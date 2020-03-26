require 'pry'

class Cell
  attr_reader :coordinate, :ship_cell

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
          @ship_cell.hit
      end
  end

  def render
    if !empty? && (@ship_cell.health == 0)
      "X"
    elsif !empty? && (@fired_upon == true)
      "H"
    elsif  empty? && (@fired_upon == true)
      "M"
    else
      "."
    end
  end
end
