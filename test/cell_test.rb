require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def test_it_exist
    cell = Cell.new('B4')
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
      cell = Cell.new('B4')
      assert_equal "B4", cell.coordinate
  end

  def test_empty?
      cell = Cell.new('B4')

      assert_equal true, cell.empty?
  end


  def test_place_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new('B4')

    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
    assert_equal cruiser, cell.ship
  end

  def test_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?

    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_fired_upon_damages_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal 2, cell.ship.health
  end

  def test_render
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)


    cell_1.render
    assert_equal ".", cell_1.render

    cell_1.fire_upon
    cell_1.render
    assert_equal "M", cell_1.render
  end

  def test_ship_has_sunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
binding.pry
    cell_2.place_ship(cruiser)
    cell_2.render
    assert_equal ".", cell_2.render
binding.pry
    cell_2.fire_upon
    cell_2.render
    assert_equal "H", cell_2.render
    assert_equal 2, cruiser.health

  end




end
