require 'sinatra'
require './lib/property.rb'
# require 'database_setup'

# Bunker class
class Bunker < Sinatra::Base

  get '/' do
    @properties = Property.all
    erb :index
  end

  get '/add_property' do
    erb :add_property
  end

  post '/update_property' do
    Property.create(name: params[:name], description: params[:description], price: params[:price])
    
    redirect '/'
  end

  run! if app_file == $0

end
