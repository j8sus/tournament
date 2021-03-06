class TournamentsController < ApplicationController
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

  def destroy
    @tournaments = Tournament.find(params[:id])

    if @tournaments.destroy
      redirect_to tournaments_path
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, team_ids: [])
  end
end
