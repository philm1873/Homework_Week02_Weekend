class Room
  attr_accessor :room_name, :guests, :songs, :room_fee

  def initialize(input_room_name)
    @room_name = input_room_name
    @room_size = 8
    @guests = []
    @songs = []
    @room_fee = {
      "Rock" => 10,
      "Hip-Hop" => 8,
      "Pop" => 3,
      "Mix n Mash" => 5
    }
  end

  def check_in(guest)
    @guests.unshift(guest) if @guests.length < @room_size
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.unshift(song)
  end

end
