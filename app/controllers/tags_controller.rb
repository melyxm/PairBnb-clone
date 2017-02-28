class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tags = Tag.new
  end

  def create
    @tags = Tag.new(tag_params)
    if @tags.save
      render 'index', notice "New tag created!"
    else
      render 'new'
  end

  def show

  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
