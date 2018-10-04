class Game < ApplicationRecord
  belongs_to :round

  def team_a_won?
    winner == team_a
  end

  def team_b_won?
    winner == team_b
  end

  def team_a_fullname
    Team.find(team_a).fullname
  end

  def team_b_fullname
    Team.find(team_b).fullname
  end

  def teams
    Team.where(id: [team_a, team_b])
  end
end
