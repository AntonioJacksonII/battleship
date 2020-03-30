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

  def render(hidden=false)
    if hidden == false && !empty? && (@ship_cell.health == 0)
      "X"
    elsif hidden == false && !empty? && (@fired_upon == true)
      "H"
    elsif hidden == false && empty? && (@fired_upon == true)
      "M"
    elsif hidden == false
      "."
    elsif hidden == true && !empty? && (@ship_cell.health == 0)
      "X"
    elsif hidden == true && !empty? && (@fired_upon == false)
      "S"
    elsif hidden == true && !empty? && (@fired_upon == true)
      "H"
    elsif hidden == true &&  empty? && (@fired_upon == true)
      "M"
    elsif hidden == true
      "."
    end
  end
end
