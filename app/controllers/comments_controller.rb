class CommentsController < ApplicationController

  def new
    if !current_user
      redirect_to root_path
      return
    end
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    if !current_user
      redirect_to home_path
      return
    end
    comment = current_user.comments.new(params.require(:comment).permit(:text))
    if comment.save
      redirect_to new_comment_path
    else
      render 'new'
    end
  end

  def edit
    if !current_user
      redirect_to root_path
      return
    end
    @comment = Comment.find(params[:id])
  end

  def update
    if !current_user
      redirect_to home_path
      return
    end
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:comment).permit(:text))
      redirect_to new_comment_path
    else
      render 'edit'
    end
  end

  # def show
  #   @comment = Comment.find(params[:id])
  # end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to new_comment_path
  end
end
