require 'sinatra'
require './lib/property.rb'
require './lib/user.rb'
require './lib/booking.rb'
require './lib/booking_details.rb'
# require 'database_setup'

# Bunker class
class Bunker < Sinatra::Base

  enable :sessions
  # set :sessions_secret, 'super secret'

  get '/' do
    erb :welcome
  end

  get '/log_in' do
    erb :log_in
  end

  post '/confirm_user' do
    # User.check(username: params[:username], password: params[:password])
    session[:username] = params[:username]
    user = User.find(username: session[:username])
    session[:user_id] = user.user_id
    redirect '/bunker'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/confirm_sign_up' do
    # session[:username] = params[:username]
    user = User.create(username: params[:username], password: params[:password], email: params[:email])
    session[:user_id] = user.user_id
    session[:username] = user.username
    redirect '/bunker'
  end

  get '/bunker' do
    @username = session[:username]
    @user_id = session[:user_id]
    @password = session[:password]
    @properties = Property.all
    erb :index
  end

  get '/manage_property' do
    @booking_details = BookingDetails.booking_details(user_id: session[:user_id])
    erb :manage_property
  end

  post '/update_property' do
    property = Property.create(host_id: session[:user_id], name: params[:name], description: params[:description], price: params[:price])
    redirect '/bunker'
  end

  get '/booking/:property_id/:host_id' do
    @property_id = params[:property_id]
    @booking = Booking.create(property_id: params[:property_id], host_id: params[:host_id], guest_id: session[:user_id], status: "requested")
    erb :booking
  end

  post '/booking_confirmation/:booking_id' do
    Booking.update(booking_id: params[:booking_id])
    redirect '/manage_property'
  end

  run! if app_file == $0

end
