class PublicRecipesController < ApplicationController
    def index
      @recipes = Recipe.includes(:user).where(public: true)
    end
    def show
      @recipe, = Recipe.where(id: params[:id], public: true)
    end
end
