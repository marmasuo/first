class BoardsController < ApplicationController

  def index
    @boards = Board.includes(:user).order("created_at DESC")
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
    redirect_to boards_path
  end
  
  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to boards_path
  end

  private
  def board_params
    params.permit(:content).merge(user_id: current_user.id)
  end

end
