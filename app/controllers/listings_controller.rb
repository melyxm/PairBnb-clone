class ListingsController < ApplicationController
  def index
      @listings = Listing.all.order('created_at ASC').paginate(page: params[:page], per_page: 9)
  end

  def new
    @listing = Listing.new
    @listings = Listing.all
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      flash[:success] = "Listing is successfully created!"
      @render_new_listing = " render \"_latestlist\" "
      redirect_to new_listing_path
    else
      flash[:danger] = @listing.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

private
  def listing_params
    params.require(:listing).permit(:title, :price, :ratings, :about, :bathroom, :bedroom, :address, :roomtype, {images: []})
  end
end
