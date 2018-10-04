class GameCreator
  def self.call(team_a_id, team_b_id, round_id)
    score_a = ScoreGenerator.random_score
    score_b = ScoreGenerator.random_score
    score_b = score_b != score_a ? score_b : score_b + 1

    Game.create!(
      team_a: team_a_id,
      team_b: team_b_id,
      score:  "#{score_a}/#{score_b}",
      winner: (score_a > score_b ? team_a_id : team_b_id),
      round_id: round_id
    )
  end
end
