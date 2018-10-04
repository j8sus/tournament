class AnnihilationController < ApplicationController
  def delete
    Team.destroy_all
    Tournament.destroy_all

    redirect_to root_path
  end
end
