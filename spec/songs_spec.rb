require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")

class TestSongs < Minitest::Test

  def setup
    @song1 = Songs.new("Perfect")
  end

  def test_SongName
    assert_equal("Perfect", @song1.songName)
  end

end
