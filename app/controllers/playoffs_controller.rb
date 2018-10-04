class PlayoffsController < ApplicationController
  before_action :set_tournament

  def create
    PlayoffCreator.new(@tournament).create

    redirect_to tournament_path(@tournament)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
