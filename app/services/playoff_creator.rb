class PlayoffCreator
  def initialize(tournament)
    @tournament = tournament
  end

  def create
    teams_with_rating = {}

    @rounds = @tournament.rounds
    @rounds.each do |round|
      teams = Team.where(id: round.teams_ids)

      teams.each do |team|
        teams_with_rating[team.id] = round.games.where(winner: team.id).count
      end
    end

    initialize_play_off(teams_with_rating)
    conduct_battles
  end

  private

  def initialize_play_off(teams_with_rating)
    sorted_teams = teams_with_rating.sort_by { |_team_id, wins| wins }.reverse[0..7]
    sorted_teams.map! { |team_score| team_score.first }

    @round = @tournament.rounds.create(round_type: 'play_off')

    4.times do
      GameCreator.call(sorted_teams.pop, sorted_teams.shift, @round.id)
    end
  end

  def conduct_battles
    while @tournament.rounds.last.winners_ids.count > 1
      last_round_winners = @tournament.rounds.last.winners_ids
      couples = last_round_winners.each_slice(2).to_a

      @new_round = @tournament.rounds.create(round_type: 'play_off')

      couples.each do |couple|
        GameCreator.call(couple.first, couple.last, @new_round.id)
      end
    end
  end
end
