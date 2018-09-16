class Rooms

  attr_reader :roomNo, :playlist, :guests, :waitingList, :rejected , :fee

  def initialize(roomNo, fee, max)
    @roomNo = roomNo # Set room number
    @fee = fee # Entry fee set during room instatiation
    @guests = [] # Guests checked-in to this
    @playlist = [] # Songs added to this
    @waitingList = [] # Guests waiting to get in a room
    @rejected = 0 # Guests rejected due to insufficient funds
    @max = max # Maximum limit of guests in a room
    # @till = 0
  end

  def addSong(song)
    @playlist.push(song)
  end

  def rmSong(song)
    @playlist.delete(song)
  end

  def checkInGuest(guest)
    if (@guests.length < @max && guest.wallet >= @fee)
      @guests.push(guest)
      guest.payEntry(@fee)
      return @fee
    elsif (guest.wallet < @fee)
      @rejected += 1
      return 0
    else
      @waitingList.push(guest)
      return 0
    end
  end

  def headCount
    return p "There is #{@guests.length} guests in the room and #{@waitingList.length} on the waiting list"
  end

  def checkOutGuest(guest)
    @guests.delete(guest)
  end

  def playlistIncludes(song)
    return playlist.include?(song)
  end

  def countCheer
    cheers = 0
    for guest in guests
      if playlistIncludes(guest.favSong)
        guest.cheer
        cheers += 1
      end
    end
    return cheers
  end


end
