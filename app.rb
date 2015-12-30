require 'sinatra/base'

class App < Sinatra::Application
  get '/' do
    'Hello world'
  end
end