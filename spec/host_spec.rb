describe Host do

	context 'checking data input types' do

		it 'confirms input type of email is String' do
	    host = Host.new
	    host.email = 'asif@asif.com'
	    expect(host.email).to be_instance_of(String)
	  end

	  it 'confirms input type of password is String' do
	    host = Host.new
	    host.password_digest = 'foobar'
	    expect(host.password_digest).to be_instance_of(String)
	  end

	  it 'confirms input type of first name is String' do
	    host = Host.new
	    host.first_name = 'Brian'
	    expect(host.first_name).to be_instance_of(String)
	  end

	  it 'confirms input type of first name is String' do
	    host = Host.new
	    host.last_name = 'Brian'
	    expect(host.last_name).to be_instance_of(String)
	  end
	end

	it { should have_property :email }
	it { should have_property :first_name }
	it { should have_property :last_name }
	it { is_expected.to have_property :password_digest }

	let!(:host) do
		Host.create(email: "brian@brian.com", password: "password",
								password_confirmation: "password", 
								first_name: "Brian", last_name: "Chemsky")
	end

	it 'authenticates with valid email and password' do
		authenticated_host = Host.authenticate(host.email, host.password)
		expect(authenticated_host).to eq host
	end

end
