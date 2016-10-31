class Listing

  attr_reader :spaces

  def initialize
    @spaces = []
  end

  def publish(space)
    @spaces << space
  end

end 
