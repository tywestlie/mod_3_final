require 'rails_helper'

describe 'user sends a post request' do
  it ' can POST to /api/v1/games/1/plays' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)
    expected_response = {"game_id"=>game.id, "score"=>[{"user_id"=>josh.id, "score"=>17}, {"user_id"=>sal.id, "score"=>16}]}

    post = {user_id: josh.id, word: 'at'}

    VCR.use_cassette('requests/api/v1/post_a_play') do

      post "/api/v1/games/#{game.id}/plays", params: post

      expect(response.status).to eq(201)


      get "/api/v1/games/#{game.id}"

      parsed = JSON.parse(response.body)

      expect(parsed).to eq(expected_response)
    end
  end
end
