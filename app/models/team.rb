class Team < ApplicationRecord
  has_and_belongs_to_many :tournaments

  def fullname
    "#{title} #{id}"
  end

  def round_wins_count(round_id)
    Game.where(round_id: round_id, winner: id).count
  end

  def won_game?(game_id)
    Game.find(game_id).winner == id
  end
end
