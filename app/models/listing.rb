require_relative '../datamapper_setup.rb'

class Listing

  include DataMapper::Resource

  property :id,             Serial

  # has n, :spaces

end
