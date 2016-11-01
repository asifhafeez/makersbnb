class Listing

  include DataMapper::Resource

  property :id,             Serial
  
  attr_reader :spaces

  def initialize
    @spaces = []
  end

  def publish(space)
    @spaces << space
  end

end
