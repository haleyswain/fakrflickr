class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]


  def index
    @images = Image.all
    @image = Image.new
    @user = current_user.id
    # @images = Image.where(owner_id: @user.id)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(paperclip: image_params[:paperclip], owner_id: current_user.id)
    if @image.save
      redirect_to images_path
    else
      render :back
    end
  end

  private
  def image_params
    params.require(:image).permit(:paperclip)
  end
end