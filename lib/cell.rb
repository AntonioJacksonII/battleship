class Cell
  attr_reader :coordinates, :ship_cell

  def initialize(location)
    @coordinates = location[:coordinates]
    @ship_cell = []
  end
