require 'app_helper'
require './app'
require 'multi_json'

RSpec.describe App do
  def app
    described_class
  end

  it '/account/:idx works' do
    get '/account/0'
    expect(MultiJson.load(last_response.body).keys).to eq(['response'])
  end
end