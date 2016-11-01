ENV['RACK_ENV'] = 'test'
require_relative '../datamapper_setup.rb'

class Space

  include DataMapper::Resource

  belongs_to :listing

  property :id,             Serial
  property :host,           String
  property :email,          String
  property :name,           String
  property :price,          Integer
  property :description,    String
  #property :from,           Date
  #property :to,             Date

end
