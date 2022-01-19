class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  def index
    @schedules = Schedule.all
  end

  def show

  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule.params)
    if @schedule.save
      redirect_to schedule_path(@schedule), notice: "予定を作成しました。"
    else
      render :new
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to :show, notice: "予定を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @schedules.destroy
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :body, :start_time)
  end
end
