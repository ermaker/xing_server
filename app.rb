require 'sinatra/base'
require 'sinatra/jbuilder'
require 'xingAPI'
require 'xingAPI/connector'
require 'multi_json'

class App < Sinatra::Application
  configure do
    @@api = XingAPI::Connector.new
  end

  get '/account/:idx' do |idx|
    @account = @@api.account(idx.to_i)
    jbuilder 'json.response @account'
  end

  post '/tr/:tr_name' do |tr_name|
    request.body.rewind
    params = MultiJson.load(request.body.string)
    case tr_name
    when 't1901'
      @result = @@api.tr_t1901(params['shcode'].to_s)
      jbuilder <<-EOJ
        json.response @result[:data]
        json.(@result, :message)
      EOJ
    when 'CSPAT00600'
      @result = @@api.tr_CSPAT00600(
        params['account'].to_s,
        params['pass'].to_s,
        params['shcode'].to_s,
        params['qty'],
        params['sell_or_buy'].to_sym,
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
