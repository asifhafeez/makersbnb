describe Listing do

  let(:space) { double(:space) }
  subject(:listing) { described_class.new}

  context "publishing a space" do

    it "can store a space" do
      listing.publish(space)
      expect(listing.spaces).to include space
    end
  end
end
