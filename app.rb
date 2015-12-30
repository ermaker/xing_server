require 'sinatra/base'
require 'sinatra/jbuilder'
require 'xingAPI'
require 'xingAPI/xingAPI'
require 'xingAPI/api'

class App < Sinatra::Application
  configure do
    @api = XingAPI::API
  end

  get '/account/:idx' do |idx|
    XingAPI::API.new(ENV['IP'], ENV['PORT'], ENV['ID'], ENV['PASS'], ENV['PASS2']) do |api|
      @account = XingAPI::XingAPI.account(idx.to_i)
    end
    jbuilder 'json.response @account'
  end
end