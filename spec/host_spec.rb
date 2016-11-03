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

end
