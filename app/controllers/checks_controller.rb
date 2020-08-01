class ChecksController < ApplicationController

  def create
    @check = Check.new(user_id: current_user.id, board_id: params[:board_id])
    @check.save
    redirect_to boards_path
  end

  def destroy
    @check = Check.find_by(user_id: current_user.id, board_id: params[:board_id])
    @check.destroy
    redirect_to boards_path
  end
  
end
