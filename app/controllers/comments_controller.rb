class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    comment = Comment.new(params.require(:user).permit(:text))
    if comment.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:dino).permit(:text))
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to users_path
  end
end
