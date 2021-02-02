require 'sinatra'
require './lib/database_setup'

# Bunker class
class Bunker < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add_property' do
    erb :add_property
  end

  run! if app_file == $0

end
