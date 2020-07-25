class ReportsController < ApplicationController

  def index
    @reports = Report.includes(:user).order("created_at DESC")
  end

  def new
    @report = Report.new
  end

  def create
    Report.create(report_params)
  end
  
  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
  end

  private
  def report_params
    params.require(:report).permit(:client, :client_person, :business, :result, :note).merge(user_id: current_user.id)
  end
  
end
