require 'rails_helper'

describe 'view game score endpoint' do
  it '/api/v1/games' do
    get "/api/v1/games/1"

    expect(response).to be_successful

    parsed = JSON.parse(response.body)
  end
end
