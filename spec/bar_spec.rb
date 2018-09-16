require("minitest/autorun")
require("minitest/rg")
require_relative("../bar")
require_relative("../rooms")
require_relative("../guests")

class TestBar < Minitest::Test

  def setup
    @bar1 = Bar.new("CCC")
    @room1 = Rooms.new(1, 10, 2)
    @guest1 = Guests.new("raymond", 30, "Perfect") # Guest(name, wallet, favourite song)
    @guest2 = Guests.new("colin", 15.5, "Perfect")
    @guest5 = Guests.new("rique", 50, "nosa nosa")

  end

  def test_payBarTil_1_guest
    fee = @room1.checkInGuest(@guest1)
    @bar1.payBarTil(fee)
    assert_equal(10, @bar1.til)
  end

  def test_payBarTil_2_guests
    @bar1.payBarTil(@room1.checkInGuest(@guest1))
    @bar1.payBarTil(@room1.checkInGuest(@guest2))
    assert_equal(20, @bar1.til)
  end

  def test_payBarTil_3_guests
    @bar1.payBarTil(@room1.checkInGuest(@guest1))
    @bar1.payBarTil(@room1.checkInGuest(@guest2))
    @bar1.payBarTil(@room1.checkInGuest(@guest5))
    assert_equal(20, @bar1.til)
    #
    # Had to return 0 in order for this test to pass.
    # Not sure if this is the best approach.
    #
  end

end
