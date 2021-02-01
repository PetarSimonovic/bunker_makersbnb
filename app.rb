# frozen_string_literal: true

require 'sinatra'
# Bunker class
class Bunker < Sinatra::Base
  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
