class Cell
  attr_reader :coordinate, :ship_cell

  def initialize(coordinate)
    @coordinate = coordinate
    @ship_cell = []
  end

  def ship
    @ship_cell
  end

  def empty?
     @ship_cell == []
  end

  def place_ship(name)
    @ship_cell.push(name)
  end

end
