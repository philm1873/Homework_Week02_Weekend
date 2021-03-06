require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("RATM", "Wake Up")
    @song2 = Song.new("N.W.A.", "Straight Outta Compton")
    @room = Room.new("Rock")
    @guest1 = Guest.new("Phil", @song1)
  end

  def test_wallet__initialising
    refute_nil(@guest1.wallet, "No number generated")
  end

  def test_pay_entrance_fee__enough
    @guest1.wallet = 50
    result = @guest1.pay_entrance_fee(@room)
    assert_equal(40, @guest1.wallet)
    assert_equal(true, result)
  end

  def test_pay_entrance_fee__not_enough
    @guest1.wallet = 5
    result = @guest1.pay_entrance_fee(@room)
    assert_equal(5, @guest1.wallet)
    assert_equal(false, result)
  end

  def test_favourite_song_woop__pass
    @room.add_song(@song1)
    result = @guest1.favourite_song_woop(@room)
    assert_equal("Whoo!! I'm gonna tear this place up!!", result)
  end

  def test_favourite_song_woop__fail
    @room.add_song(@song2)
    result = @guest1.favourite_song_woop(@room)
    assert_equal("This playlist is minging", result)
  end

end
