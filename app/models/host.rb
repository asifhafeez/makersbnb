class Host

	include DataMapper::Resource

  property :id,    		Serial
	property :email, 		String, required: true
	property :first_name, String, required: true
	property :last_name, String
	property :password, String, required: true

end
