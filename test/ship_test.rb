require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
    assert_instance_of Ship, @cruiser
  end

  def test_ship_name
    assert_equal 'Cruiser', @cruiser.name
  end

  def test_ship_length
    assert_equal 3, @cruiser.length
  end

  def test_ship_health
    assert_equal 3, @cruiser.health
  end

  def test_sunk_status
    assert_equal false, @cruiser.sunk?
  end


end
