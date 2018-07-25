class Api::V1::Games::PlaysController < ApplicationController
  def create
    play = Play.create(user_id: params[:user_id], word: params[:word], game_id: params[:id])
  end
end
