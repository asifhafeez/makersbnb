class Space

  include DataMapper::Resource
  include DataMapper::Validations

  # belongs_to :listing

  property :id,             Serial
  property :host,           String
  property :email,          String
  property :name,           String, required: true
  property :price,          String, required: true
  property :description,    String, required: true
  #property :from,           Date
  #property :to,             Date

end
