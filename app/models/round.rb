class Round < ApplicationRecord
  belongs_to :tournament
  has_many :games, dependent: :destroy

  def teams_ids
    games.pluck(:team_a, :team_b).flatten.uniq
  end

  def teams
    Team.where(id: teams_ids)
  end

  def winners_ids
    games.pluck(:winner)
  end

  def position
    group_rounds_order = tournament.rounds.where(round_type: 'group').pluck(:id)
    group_rounds_order.index(id)
  end
end
