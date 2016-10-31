require 'sinatra/base'

# require_relative 'models/listing'
# require_relative 'models/space'
# require_relative 'models/user'

class Makersbnb < Sinatra::Base
  get '/' do
    'Hello Makersbnb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
