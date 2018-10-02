class EraseController < ApplicationController
  def erase
    Team.destroy_all
    Tournament.destroy_all

    redirect_to root_path
  end
end
