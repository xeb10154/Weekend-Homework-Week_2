require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")
require_relative("../bar")

class TestRooms < Minitest::Test

  def setup
    @bar1 = Bar.new("CCC")
    @song1 = Songs.new("Perfect") # song1 takes favSong name as arg
    @song2 = Songs.new("Shape of You")
    @room1 = Rooms.new(1, 10, 2) # room(roomNo, entryFee, max)
    @guest1 = Guests.new("raymond", 30, "Perfect") # Guest(name, wallet, favourite song)
    @guest2 = Guests.new("colin", 15.5, "Perfect")
    @guest3 = Guests.new("steve", 3.5, "A Team")
    @guest4 = Guests.new("maria", 0, "Shape of You")
    @guest5 = Guests.new("rique", 50, "nosa nosa")
  end

  def test_roomNo # Get room number
    assert_equal(1, @room1.roomNo)
  end

  def test_playlist # Test that playlist array exist
    assert_equal([], @room1.playlist)
  end

  def test_addSong # Add song to playlist
    @room1.addSong(@song1.songName)
    assert_equal(1, @room1.playlist.length)
  end

  def test_songInclude # Test if song is included on playlist
    @room1.addSong(@song1.songName)
    assert_equal(true, @room1.playlistIncludes("Perfect"))
  end

  def test_rmSong # Remove song from playlist
    @room1.addSong(@song1.songName)
    @room1.rmSong(@song1.songName)
    assert_equal(0, @room1.playlist.length)
  end

  def test_guestList # Test that guest array exist
    assert_equal([], @room1.guests)
  end

  def test_checkInGuest # Add guest object to array
    @room1.checkInGuest(@guest1)
    assert_equal(1, @room1.guests.length)
    assert_equal(20, @guest1.wallet) # verify fund are taken
  end

  def test_checkOutGuest # Remove guest object from array
    @room1.checkInGuest(@guest1)
    @room1.checkOutGuest(@guest1)
    assert_equal(0, @room1.guests.length)
  end

  def test_maxGuests # Max guest limit is set at 2 for room1.
    @room1.checkInGuest(@guest1)
    @room1.checkInGuest(@guest2)
    @room1.checkInGuest(@guest5)
    assert_equal(2, @room1.guests.length)
    assert_equal(1, @room1.waitingList.length)
    assert_equal("There is 2 guests in the room and 1 on the waiting list", @room1.headCount)
  end

  def test_maxGuests__insufficient_fees # Guests who cannot pay the entry fee are added to the rejected list.
    @room1.checkInGuest(@guest1)
    @room1.checkInGuest(@guest2)
    @room1.checkInGuest(@guest3) # This wallet is low
    @room1.checkInGuest(@guest4) # This wallet is low
    @room1.checkInGuest(@guest5)
    assert_equal(2, @room1.guests.length)
    assert_equal(1, @room1.waitingList.length)
    assert_equal(2, @room1.rejected)
    assert_equal("There is 2 guests in the room and 1 on the waiting list", @room1.headCount)
  end

  def test_countCheers
    @room1.addSong(@song1.songName)
    @room1.addSong(@song2.songName)
    @room1.checkInGuest(@guest1)
    @room1.checkInGuest(@guest2)
    @room1.checkInGuest(@guest3) # This wallet is low
    @room1.checkInGuest(@guest4) # This wallet is low
    @room1.checkInGuest(@guest5)
    assert_equal(2, @room1.countCheer) # Count number of cheers.
  end

  # def test_payBarTil
  #   # Method and tests for Fees paid to til are in bar_spec.rb file.
  # end

end
