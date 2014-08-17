class ImagesController < ApplicationController
  
  def index
    @images = Image.all
  end

  def new
    if !current_user
      redirect_to root_path
      return
    end
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

  def show
    @current_user = current_user
    # Tell the UserMailer to send email linking to edit password page
    UserMailer.email_location(@current_user).deliver
    redirect_to root_path
  end

end
