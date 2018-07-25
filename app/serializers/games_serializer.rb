class GamesSerializer < ActiveModel::Serializer
  attributes :game_id, :score

  def game_id
    object.id
  end

  def score
    [{"user_id": object.player_1.id, "score:"},{"user_id": object.player_2.id}]
  end

end
