class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params_filter)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private
  def params_filter
    params.require(:image).permit(:title, :username, :description, :url)
  end

end
