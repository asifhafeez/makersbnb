require 'bcrypt'

class Host
	include DataMapper::Resource

  property :id,    					 Serial
	property :email, 					 String, required: true
	property :first_name, 		 String, required: true
	property :last_name, 		   String
	property :password_digest, Text

	has n, :spaces

	attr_reader :password
	attr_accessor :password_confirmation
	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		host = first(email: email)
		if host && BCrypt::Password.new(host.password_digest) == password
			host
		else
			nil
		end
	end
end
