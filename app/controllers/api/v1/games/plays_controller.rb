class Api::V1::Games::PlaysController < ApplicationController
  def create
    play = Play.new(user_id: params[:user_id], word: params[:word], game_id: params[:id])
    if play.save
      render json: {message: "play created"}, status: :created
    end
  end
end
