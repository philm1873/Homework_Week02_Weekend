class Room
  attr_accessor :guests, :songs

  def initialize(input_room_name)
    @room_name = input_room_name
    @room_size = 8
    @guests = []
    @songs = []
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
