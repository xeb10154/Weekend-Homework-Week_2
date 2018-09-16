class Guests

  attr_reader :name, :wallet, :favSong

  def initialize(name, wallet, favSong)
    @name = name
    @wallet = wallet
    @favSong = favSong
  end

  def payEntry(fee)
    if (@wallet >= fee)
      @wallet -= fee
    end
  end

  def cheer
    return "Whoo!"
  end

end
