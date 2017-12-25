require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Rock")
    @song1 = Song.new("RATM", "Wake Up")
    @song2 = Song.new("N.W.A.", "Express Yo Self")
    @song3 = Song.new("The Rolling Stones", "Paint it Black")
    @song4 = Song.new("Jimi Hendrix", "Little Wing")
    @guest1 = Guest.new("Phil", @song1)
    @guest2 = Guest.new("Alex", @song2)
    @guest3 = Guest.new("Matt", @song1)
    @guest4 = Guest.new("Jardine", @song2)
    @guest5 = Guest.new("Ben", @song3)
    @guest6 = Guest.new("Sophie", @song4)
    @guest7 = Guest.new("Mark", @song3)
    @guest8 = Guest.new("Fraser", @song4)
    @guest9 = Guest.new("Kris", @song2)
    binding.pry
  end

  def test_check_in
    @room.check_in(@guest1)
    assert_equal([@guest1], @room.guests)
  end

  def test_check_in__room_full
    @room.guests = [@guests1, @guest2, @guest3, @guest4, @guest5, @guest6, @guest7, @guest8]
    @room.check_in(@guest9)
    assert_equal(8, @room.guests.length)
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
