require 'minitest/autorun'
require 'minitest/pride'
#require './lib/ship'

class Cell
  attr_reader :coordinates

  def initialize(location)
    @coordinates = location[:coordinates]

  end



end
