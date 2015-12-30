require 'sinatra/base'
require 'sinatra/jbuilder'
require 'xingAPI'
require 'xingAPI/xingAPI'
require 'xingAPI/api'

class App < Sinatra::Application
  configure do
    @@api = XingAPI::API.new(
      ENV['TRADE_IP'], ENV['TRADE_PORT'],
      ENV['ID'], ENV['PASS'], ENV['PASS2'])
  end

  get '/account/:idx' do |idx|
    @account = @@api.account(idx.to_i)
    jbuilder 'json.response @account'
  end
end