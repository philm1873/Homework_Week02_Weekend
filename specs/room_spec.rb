require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Rock")
    @guest1 = Guest.new("Phil")
    @guest2 = Guest.new("John")
    @guest3 = Guest.new("Matt")
    @song1 = Song.new("RATM", "Wake Up")
  end

  def test_check_in
    @room.check_in(@guest1)
    assert_equal([@guest1], @room.guests)
  end

  def test_check_out
    @room.guests = [@guest1, @guest2, @guest3]
    @room.check_out(@guest1)
    assert_equal([@guest2, @guest3], @room.guests)
  end

  def test_add_song
    @room.add_song(@song1)
    assert_equal([@song1], @room.songs)
  end

end
