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

  def to_symbol(value)
    case value
    when Array
      value.map { |v| to_symbol(v) }
    when Hash
      Hash[value.map { |key, value| [key.to_sym, to_symbol(value)] }]
    else
      value
    end
  end

  post '/tr/:tr_name' do |tr_name|
    request.body.rewind
    params = to_symbol(MultiJson.load(request.body.string))
    case tr_name
    when 'CSPAT00600'
      @result = @@api.tr_CSPAT00600(
        params[:account].to_s,
        params[:pass].to_s,
        params[:shcode].to_s,
        params[:qty],
        params[:sell_or_buy].to_sym,
        )
    else
      @result = @@api.tr(tr_name, **params)
    end
    jbuilder <<-EOJ
      json.(@result, 'response', 'message')
    EOJ
  end
end
