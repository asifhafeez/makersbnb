require 'data_mapper'

class BookingRequest

  include DataMapper::Resource
  include DataMapper::Validations

  property :id,        Serial
  property :name,      String,  required: true
  property :email,     String,  required: true
  property :datefrom,  Date,    required: true
  property :dateto,    Date,    required: true
  property :purpose,   String

  belongs_to :space

end
