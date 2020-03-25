class Cell
  attr_reader :coordinates, :ship_cell

  def initialize(location)
    @coordinates = location[:coordinates]
    @ship_cell = []
  end

  def ship
    @ship_cell
  end

  def empty?
    if @ship_cell == []
      true
    else
      false
    end
  end

  def place_ship(name)
    @ship_cell.push(name)
  end
  
end
