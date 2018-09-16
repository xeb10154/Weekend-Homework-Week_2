require("minitest/autorun")
require("minitest/rg")
require_relative("../guests")
require_relative("../rooms")

class TestGuests < Minitest::Test

  def setup
    @room1 = Rooms.new(1, 10, 2)
    @guest1 = Guests.new("raymond", 30, "Perfect") # Guest(name, wallet, favourite song)
    @guest2 = Guests.new("colin", 15.5, "Perfect")
    @guest3 = Guests.new("steve", 3.5, "A Team")
    @guest4 = Guests.new("maria", 0, "Shape of You")
    @guest5 = Guests.new("rique", 50, "nosa nosa")
  end

  def test_Name
    assert_equal("raymond", @guest1.name)
  end

  def test_payEntry
    @guest1.payEntry(10)
    assert_equal(20, @guest1.wallet)
  end

  def test_payEntry__float
    @guest2.payEntry(10)
    assert_equal(5.5, @guest2.wallet)
  end

  def test_insufficientFunds__float
    @guest3.payEntry(10)
    assert_equal(3.5, @guest3.wallet)
  end

  def test_insufficientFunds__zero
    @guest4.payEntry(10)
    assert_equal(0, @guest4.wallet)
  end

  def test_cheer
    assert_equal("Whoo!", @guest1.cheer)
  end

end
