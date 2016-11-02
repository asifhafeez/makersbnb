class Space

  include DataMapper::Resource
  include DataMapper::Validations

  # belongs_to :listing

  property :id,             Serial
  property :host,           String
  property :email,          String
  property :name,           String, required: true
  property :price,          Decimal, precision: 8, scale: 2, required: true
  property :description,    Text, required: true
  property :from,           Date
  property :to,             Date

end
