require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exist
    cell = Cell.new(coordinates: 'B4')
    require 'pry'; binding.pry
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
      cell = Cell.new(coordinates: 'B4')
      assert_equal "B4", cell.coordinates
  end

  def test_empty?
      cell = Cell.new(coordinates: 'B4')
      require 'pry'; binding.pry
      assert_equal true, cell.empty?
  end


  def test_place_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new(coordinates: 'B4')
    require 'pry'; binding.pry

    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
    assert_equal [cruiser], cell.ship
  end


end
