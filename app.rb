require 'sinatra'
require './lib/property.rb'
require './lib/user.rb'
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
    session[:id] = user.id
    redirect '/bunker'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/confirm_sign_up' do
    session[:username] = params[:username]
    User.create(username: session[:username], password: params[:password], email: params[:email])
    redirect '/bunker'
  end

  get '/bunker' do
    @username = session[:username]
    @id = session[:id]
    @password = session[:password]
    @properties = Property.all
    erb :index
  end

  get '/add_property' do
    erb :add_property
  end

  post '/update_property' do
    Property.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/bunker'
  end

  run! if app_file == $0

end
