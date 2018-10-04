class FakeTournamentCreator
  def create
    add_teams_if_necessary

    Tournament.create!(title: Faker::App.name, teams: teams)
  end

  private

  def add_teams_if_necessary
    team_count = Team.count

    if team_count < 16
      (16 - team_count).times do
        Team.create!(title: Faker::Team.name)
      end
    end
  end

  def teams
    @teams_ids = Team.order("RANDOM()").last(16)
  end
end
