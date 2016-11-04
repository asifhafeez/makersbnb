describe Space do

  it { should have_property :name }
  it { should have_property :price }
  it { should have_property :description }
  it { should have_property :from }
  it { should have_property :to }

  context 'checking data input types' do

    it 'confirms input type of name is string' do
      space = Space.new
      space.name = 'Boudoir'
      expect(space.name).to be_instance_of(String)
    end

    it 'confirms input type of price is Decimal' do
      space = Space.new
      space.price = '25'
      expect(space.price).to be_instance_of(BigDecimal)
    end

    it 'confirms input type of description is text' do
      space = Space.new
      space.description = 'A dark and sexy room'
      expect(space.description).to be_instance_of(String)
    end

    it 'confirms input type of from is Date' do
      space = Space.new
      space.from = '160211'
      expect(space.from).to be_instance_of(Date)
    end

    it 'confirms input type of to is Date' do
      space = Space.new
      space.to = '160211'
      expect(space.to).to be_instance_of(Date)
    end
  end
end
