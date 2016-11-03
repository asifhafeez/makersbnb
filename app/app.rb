ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Makersbnb < Sinatra::Base

  register Sinatra::Flash

  set :sessions, true

  get '/' do
    @spaces = Space.all
    erb :index
  end

  post '/spaces' do
    space = Space.new(host: params[:host], email: params[:email],
    name: params[:name], price: params[:price],
    description: params[:description])
    if space.save
      flash.keep[:notice] = ["Your space was listed!"]
      p flash[:notice]
    else
      flash.keep[:notice] = space.errors.full_messages
    end
    redirect '/'
  end

  get '/booking_request' do
  erb :booking_request
end

# post '/booking_request' do
#   booking = BookingRequest.new(name: params[:name], email: params[:email],
#                                datefrom: params[:datefrom], dateto: params[:dateto],
#                                purpose: params[:purpose])
#   redirect '/'
# end

run! if app_file == $0
end
