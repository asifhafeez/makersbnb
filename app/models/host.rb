class Host

	include DataMapper::Resource

  property :id,    		Serial
	property :email, 		String
	property :password_digest, String

end
