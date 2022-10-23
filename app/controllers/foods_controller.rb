class FoodsController < ApplicationController
  before_action :authenticate_user!
  # GET /foods {food list page}
  def index
    @foods = Food.where(user: current_user)
  end

  # GET /foods/new {create form page}
  def new
    @food = Food.new
  end

  # POST /foods {Create Action}
  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Delete Food Action
  def destroy
    @food = Food.where(id: params[:id], user: current_user)
    redirect_to foods_path, notice: 'Food was successfully destroyed.' if @food.destroy(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit).merge(user: current_user)
  end
end
