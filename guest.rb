class Guest
  attr_reader :guest_name, :favourite_song
  attr_accessor :wallet

  def initialize(input_guest_name, input_favourite_song)
    @guest_name = input_guest_name
    @wallet = rand(50)
    @favourite_song = input_favourite_song
  end

  def pay_entrance_fee(room)
    if @wallet >= room.room_fee[room.room_name]
      @wallet -= room.room_fee[room.room_name]
      return true
    end
    return false
  end

  def favourite_song_woop(room)
    for song in room.songs
      if song == @favourite_song
        return "Whoo!! I'm gonna tear this place up!!"
      end
    end
    return "This playlist is minging"
  end

end
