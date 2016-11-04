class Space

  include DataMapper::Resource
  include DataMapper::Validations

  property :id,             Serial
  property :name,           String, required: true
  property :price,          Decimal, precision: 8, scale: 2, required: true
  property :description,    Text, required: true
  property :from,           Date
  property :to,             Date

  belongs_to :host

end
