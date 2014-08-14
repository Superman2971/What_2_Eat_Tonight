class ImagesController < ApplicationController
  
  def show
    @images = Image.all
  end

  def new
    if !current_user
      redirect_to root_path
      return
    end
    @images = Image.all
    @image = Image.new
  end

  def create
    if !current_user
      redirect_to root_path
      return
    end
    image = current_user.images.new(params.require(:image).permit(:cuisine, :restaurant, :location, :image))
    if image.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if !current_user
      redirect_to root_path
      return
    end
    @image = Image.find(params[:id])
  end

  def update
    if !current_user
      redirect_to home_path
      return
    end
    @image = Image.find(params[:id])
    if @image.update_attributes(params.require(:comment).permit(:text))
      redirect_to new_comment_path
    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to new_comment_path
  end
end
