class SpendsController < ApplicationController
  before_action :set_spend, only: %i[ show edit update destroy ]

  def new
    @spend = Spend.new
  end

  def index
    @spends = Spend.all
  end

  def create
    @spend = Spend.new(spend_params)
    if @spend.save
      redirect_to spend_path(@spend), notice: "支出が記録されました。"
    else
      render :new, notice: "支出の記録に失敗しました。"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @spend.update(spend_params)
      redirect_to spend_path(@spend), notice: "支出を更新しました。"
    else
      render :new, notice: "支出の更新に失敗しました。"
    end
  end

  def destroy
    @spend.destroy
    redirect_to spends_path, notice: "支出を削除しました。"
  end

  private
  def set_spend
    @spend = Spend.find(params[:id])
  end

  def spend_params
    params.require(:spend).permit(:body, :money)
  end
end
