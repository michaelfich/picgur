class ImagesController < ApplicationController

  def index
    @images = Image.where(deleted: false)
  end

  def new
    @title = "New Image"
    @image = Image.new
  end

  def create
    @image = Image.new(params_filter)
    @image.deleted = false
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  def show
    id = params[:id]
    @image = Image.find(id)
    @title = @image.title
  end

  def edit
    id = params[:id]
    @image = Image.find(id)
  end

  def update
    id = params[:id]
    @image = Image.find(id)
    @image.update_attributes(params_filter)
    if @image.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    @image = Image.find(id)
    @image.deleted = true
    @image.save
    redirect_to image_path
  end

  private
  def params_filter
    params.require(:image).permit(:title, :username, :description, :url)
  end

end
