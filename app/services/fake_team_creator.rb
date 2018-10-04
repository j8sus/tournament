class FakeTeamCreator
  def initialize(times)
    @times = times
  end

  def create
    @times.times do
      Team.create!(title: Faker::Team.name)
    end
  end
end
