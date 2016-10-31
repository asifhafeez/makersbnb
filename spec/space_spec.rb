describe Space do

  let(:user) { double(:user) }
  subject(:space) { described_class.new(user, "Space 1", 10, "Spacious two bedroom", DateTime.new(2016,10,31), DateTime.new(2016,11,1)) }

  before { Timecop.freeze(Time.now) }
  
  context "attributes" do

    it "has a host" do
      expect(space.host).to eq(user)
    end

    it "has a name" do
      expect(space.name).to eq "Space 1"
    end

    it "has a price" do
      expect(space.price).to eq 10
    end

    it "has a description" do
      expect(space.description).to eq "Spacious two bedroom"
    end

    it "the space is available to rent from" do
      expect(space.from).to eq DateTime.new(2016,10,31)
    end

    it "the space is available to rent until" do
      expect(space.to).to eq DateTime.new(2016,11,1)
    end

    it "the space is available to rent" do
      expect(space).to be_available
    end
  end
  
end
