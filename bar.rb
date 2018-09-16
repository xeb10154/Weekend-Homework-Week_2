class Bar

  attr_reader :name, :til


  def initialize(name)
    @name = name
    @til = 0
    # @rooms = 0 # Not sure how to increment room count everytime an instantiation of a room is created.
  end

  def payBarTil(fee)
    @til += fee
  end


end
