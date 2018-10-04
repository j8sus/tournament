class FakeTournamentsController < ApplicationController
  def create
    FakeTournamentCreator.new.create

    redirect_to tournaments_path
  end
end
