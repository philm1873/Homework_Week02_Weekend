require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")

class TestGuest < MiniTest::Test

  def setup
    @room = Room.new("Rock")
    @guest1 = Guest.new("Phil")
  end

  def test_wallet__initialising
    refute_nil(@guest1.wallet, "No number generated")
  end

  def test_pay_entrants_fee__enough
    @guest1.wallet = 50
    result = @guest1.pay_entrants_fee(@room)
    assert_equal(40, @guest1.wallet)
    assert_equal(true, result)
  end

  def test_pay_entrants_fee__not_enough
    @guest1.wallet = 5
    result = @guest1.pay_entrants_fee(@room)
    assert_equal(5, @guest1.wallet)
    assert_equal(false, result)
  end

end
