class Space

  attr_reader :name, :price, :description, :from, :to, :available, :host

  def initialize(host, name, price, description, from, to)
    @host = host
    @name = name
    @price = price
    @description = description
    @from = from
    @to = to
    check_availability
  end

  def check_availability
    date = DateTime.now
    @available = true if date > @from && date < @to
  end

  def available?
    @available
  end
end
