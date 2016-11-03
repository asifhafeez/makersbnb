require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require_relative 'models/space'
<<<<<<< HEAD
require_relative 'models/booking_request'
require_relative 'models/user'
=======
require_relative 'models/listing'
require_relative 'models/host'
>>>>>>> aeacd3aa7705038951af994ce82fe59cfb366b61

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
