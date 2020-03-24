require 'minitest/autorun'
require 'minitest/pride'
#require './lib/ship'

class Cell
  attr_reader :coordinates

  def initialize(location)
    @coordinates = location[:coordinates]

  end

  def empty?
      if cells = []
        true
      else
        false
      end
end

  def place_ship(ship)
    cells << []
  end

  def fired_upon?
    false
  end

end
