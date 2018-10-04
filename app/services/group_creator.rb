class GroupCreator
  def initialize(tournament)
    @tournament = tournament
  end

  def create
    couples.each do |couple|
      GameCreator.call(couple.first, couple.last, @new_round.id)
    end
  end

  private

  def couples
    @new_round = @tournament.rounds.create!(round_type: 'group')

    teams_ids = @tournament.teams.pluck(:id)

    first_division_teams_ids = @tournament.rounds.first&.teams_ids
    teams_ids -= first_division_teams_ids if first_division_teams_ids

    teams_ids.sample(8).combination(2)
  end
end
