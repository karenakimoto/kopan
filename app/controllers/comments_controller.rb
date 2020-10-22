class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to recipe_path(recipe.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end