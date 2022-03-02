class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  def new
    @schedule = Schedule.new
  end
  def create
    Schedule.create(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    redirect_to action: :index
  end
  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  def update
    Schedule.update(params[:id], params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    redirect_to action: :index
  end

  def destroy
    Schedule.destroy(params[:id])
    redirect_to action: :index
  end
end
