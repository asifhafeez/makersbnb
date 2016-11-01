class Space

  include DataMapper::Resource

  # belongs_to :listing

  property :id,             Serial
  property :host,           String
  property :email,          String
  property :name,           String
  property :price,          String
  property :description,    String
  #property :from,           Date
  #property :to,             Date

end
