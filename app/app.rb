ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'datamapper_setup'

class Makersbnb < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do

    redirect '/'
  end

  run! if app_file == $0
end
