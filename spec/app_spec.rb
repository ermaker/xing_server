require 'app_helper'
require './app'
require 'multi_json'

RSpec.describe App do
  def app
    described_class
  end

  def post_json(url, json)
    post(url, json, content_type: 'application/json')
  end

  xit 'get /account/:idx works' do
    get '/account/0'
    expect(last_response).to be_ok
    expect(MultiJson.load(last_response.body).keys).to eq(['response'])
  end

  describe 'post /tr/:tr_name' do
    xit 't1901 works' do
      post_json '/tr/t1901', shcode: 122630
      expect(last_response).to be_ok
      response = MultiJson.load(last_response.body)
      expect(response.keys).to eq(['response', 'message'])
      expect(response['response'].keys).to have_exactly(127).items
      expect(response['message']).to eq('[00000] 조회완료')
    end
  end
end