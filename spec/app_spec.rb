require 'app_helper'
require './app'

RSpec.describe App do
  def app
    described_class
  end

  it 'works' do
    get '/'
    expect(last_response.body).to eq('Hello world')
  end
end