class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.where(user: current_user).order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    @foods = Food.where(user: current_user)
  end

  def destroy
    @recipe, = Recipe.where(id: params[:id], user: current_user)
    redirect_to recipes_path, notice: 'Recipe deleted!' if @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description).merge(user: current_user)
  end
end
