require 'sinatra/base'

require_relative 'models/listing'
require_relative 'models/space'
require_relative 'models/user'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do

    redirect '/'
  end

  run! if app_file == $0
end
