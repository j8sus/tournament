class FakeTeamsController < ApplicationController
  def create
    FakeTeamCreator.new(16).create

    redirect_to teams_path
  end
end
