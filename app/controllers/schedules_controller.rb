class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  def index
    @schedules = current_user.schedules
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user
    if @schedule.save
      redirect_to schedule_path(@schedule), notice: "予定を作成しました。"
    else
      render :new, notice: "予定の作成に失敗しました。"
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule), notice: "予定を更新しました。"
    else
      render :new, notice: "予定の変更に失敗しました。"
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path, notice: "予定を削除しました。"
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :body, :start_time)
  end
end
