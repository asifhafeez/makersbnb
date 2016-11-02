ENV['RACK_ENV'] = 'test'
require_relative '../datamapper_setup'

class BookingRequest

  include DataMapper::Resource
  include DataMapper::Validations

  property :id,        Serial
  property :name,      String, required: true
  property :email,     String, required: true
  property :purpose,   String, required: true

  # has n, :spaces

end
