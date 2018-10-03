class TournamentsController < ApplicationController
  before_action :add_teams_if_necessary, only: :create_fake

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to tournament_path(@tournament)
    else
      render :new
    end
  end

  def create_fake
    Tournament.create(title: Faker::App.name, teams: teams)

    redirect_to tournaments_path
  end

  def destroy
    @tournaments = Tournament.find(params[:id])

    if @tournaments.destroy
      redirect_to tournaments_path
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :team_ids)
  end

  def add_teams_if_necessary
    team_count = Team.count

    if team_count < 16
      (16 - team_count).times do
        Team.create(title: Faker::Team.name)
      end
    end
  end

  def teams
    @teams_ids = Team.order("RANDOM()").last(16)
  end
end
