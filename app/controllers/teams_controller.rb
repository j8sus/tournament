class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    if Team.create(team_params)
      redirect_to teams_path
    else
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])

    if @team.destroy
      redirect_to teams_path
    end
  end

  def create_fake
    16.times do
      Team.create(title: Faker::Team.name)
    end

    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:title)
  end
end
