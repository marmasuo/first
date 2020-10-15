class ReportsController < ApplicationController
  before_action :move_to_top

  def index
    @reports = Report.includes(:user).order("created_at DESC")
  end

  def new
    @report = Report.new
  end

  def create
    Report.create(report_params)
    redirect_to reports_path
  end
  
  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments.includes(:user)
  end

  def edit
    @report = Report.find(params[:id])
    if @report.user_id != current_user.id
      redirect_to reports_path
    end
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    redirect_to reports_path
  end

  def destroy
    report = Report.find(params[:id])
    if report.user_id == current_user.id
      report.destroy
      redirect_to reports_path
    end
  end

  def search
    @reports = Report.search(params[:keyword])
  end

  private
  def report_params
    params.require(:report).permit(:client, :client_person, :business, :result, :note).merge(user_id: current_user.id)
  end

  def move_to_top
    unless user_signed_in?
      redirect_to root_path
    end
  end
  
end
