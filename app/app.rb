ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'datamapper_setup'

class Makersbnb < Sinatra::Base

  get '/' do
  	@spaces = Space.all
    erb :index
  end

  post '/spaces' do
  	space = Space.create(host: params[:host], email: params[:email],
  	 									name: params[:name], price: params[:price], 
  									  description: params[:description])
    redirect '/'
  end

  run! if app_file == $0
end
