ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Makersbnb < Sinatra::Base

  register Sinatra::Flash

  set :sessions, true
  set :session_secret, 'super secret'

  get '/' do
    @spaces = Space.all
    erb :index
  end

  get '/spaces' do
    erb :add_space
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

post '/booking_request' do
  booking = BookingRequest.new(name: params[:name], email: params[:email],
                               datefrom: params[:datefrom], dateto: params[:dateto],
                               purpose: params[:purpose])
   if booking.save
    flash.keep[:notice] = ["Your booking is confirmed!"]
    p flash[:notice]
  else
    flash.keep[:notice] = booking.errors.full_messages
   end
  redirect '/'
end

  post '/hosts' do
    host = Host.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if host.save
      flash.keep[:notice] = ["Successfully signed up!"]
    else
      flash.keep[:notice] = host.errors.full_messages
    end
    redirect '/'
  end

  run! if app_file == $0
end
