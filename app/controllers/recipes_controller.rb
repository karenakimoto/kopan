class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new]

  def index
    @recipes = Recipe.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @recipe.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :bread, :breadtype_id, :material, :recipe, :calorie, :image ).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
