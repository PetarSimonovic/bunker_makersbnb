require 'sinatra'
require './lib/property.rb'
# require 'database_setup'

# Bunker class
class Bunker < Sinatra::Base

  enable :sessions

  get '/' do 
    erb :welcome
  end

  get '/log_in' do 

  end

  get '/sign_up' do 
    erb :sign_up
  end
  
  post '/confirm_sign_up' do
    session[:username] = params[:username]
    redirect '/bunker'
  end

  get '/bunker' do
    @username = session[:username]
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
