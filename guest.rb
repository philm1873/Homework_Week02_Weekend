class Guest
  attr_reader :guest_name
  attr_accessor :wallet

  def initialize(input_guest_name)
    @guest_name = input_guest_name
    @wallet = rand(50)
  end

  def pay_entrants_fee(room)
    if @wallet >= room.room_fee[room.room_name]
      @wallet -= room.room_fee[room.room_name]
      return true
    end
    return false
  end

end
