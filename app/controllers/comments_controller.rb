class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      p 'saved'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
      p 'not saved'
    end
  end
end
