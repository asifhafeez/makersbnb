describe User do

	subject(:user) { described_class.new("foobar", "email@email.com")}

	context "attributes" do
    
    it "has a name" do
    	expect(user.name).to eq "foobar"
    end

    it "has an email" do
      expect(user.email).to eq "email@email.com"
    end
	end
end