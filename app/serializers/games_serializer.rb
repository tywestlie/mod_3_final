class GamesSerializer < ActiveModel::Serializer
  attributes :game_id, :score

  def game_id
    object.id
  end

  def score
    [{"user_id": object.player_1.id, "score": user_score(object.player_1.id)},{"user_id": object.player_2.id, "score": user_score(object.player_2.id)}]
  end

  def user_score(id)
    user_plays = object.plays.select do |play|
      play.user_id == id
    end
    sum_scores(user_plays)
  end

  def sum_scores(plays)
    plays.sum do |play|
      play.score
    end
  end
end
