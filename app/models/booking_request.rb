ENV['RACK_ENV'] = 'test'
require_relative '../datamapper_setup'

class BookingRequest

  include DataMapper::Resource
  include DataMapper::Validations

  property :id,        Serial
  property :name,      String,  required: true
  property :email,     String,  required: true
  property :datefrom,  Date,    required: true
  property :dateto,    Date,    required: true
  property :purpose,   String

  # has n, :spaces

end
