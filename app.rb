require 'sinatra'
require 'database_setup'

# Bunker class
class Bunker < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0

end
