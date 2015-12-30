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

  post '/tr/:tr_name' do |tr_name|
    case tr_name
    when 't1901'
      @result = @@api.tr_t1901(params[:shcode])
      jbuilder <<-EOJ
        json.response @result[:data]
        json.(@result, :message)
      EOJ
    when 'CSPAT00600'
      @result = @@api.tr_CSPAT00600(
        params[:account],
        params[:pass],
        params[:shcode],
        params[:qty],
        params[:sell_or_buy].to_sym,
        )
      jbuilder <<-EOJ
        json.response @result[:data]
        json.(@result, :message)
      EOJ
    else
      abort
    end
  end
end
