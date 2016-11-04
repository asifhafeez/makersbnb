ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Makersbnb < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride


  set :sessions, true
  set :session_secret, 'super secret'

  get '/' do
    @spaces = Space.all
    erb :index
  end

  post '/hosts' do
    host = Host.new(first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    if host.save
      session[:host_id] = host.id
      flash.keep[:notice] = ["Successfully signed up!"]
    else
      flash.keep[:notice] = host.errors.full_messages
    end
    redirect '/'
  end

  post '/sessions' do
    host = Host.authenticate(params[:Email], params[:Password])
    if host
      session[:host_id] = host.id
    end
    redirect '/'
  end

  delete '/sessions' do
    session[:host_id] = nil
    redirect '/'
  end

  get '/spaces' do
    erb :add_space
  end

  post '/spaces' do
    space = Space.new(name: params[:name], price: params[:price],
    from: params[:from], to: params[:to],
    description: params[:description])
    current_host.spaces << space
    if current_host.save
      flash.keep[:notice] = ["Your space was listed!"]
      redirect '/'
    else
      flash.keep[:notice] = space.errors.full_messages
      redirect '/spaces'
    end
  end

  get '/booking_request' do
    erb :booking_request
  end

  post '/booking_request' do
    booking = BookingRequest.new(name: params[:name], email: params[:email],
    datefrom: params[:from], dateto: params[:to],
    purpose: params[:purpose])

    if booking.save
      flash.keep[:notice] = ["Your booking is confirmed!"]
      redirect '/'
    else
      flash.keep[:notice] = booking.errors.full_messages
      redirect '/booking_request'
    end
  end

  helpers do
    def current_host
      @current_host ||= Host.get(session[:host_id])
    end
  end

  run! if app_file == $0
end
