class BoardsController < ApplicationController
  before_action :move_to_top

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
    if board.user_id == current_user.id
      board.destroy
      redirect_to boards_path
    end
  end

  private
  def board_params
    params.permit(:content).merge(user_id: current_user.id)
  end

  def move_to_top
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
