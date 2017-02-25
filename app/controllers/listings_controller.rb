class ListingsController < ApplicationController
  def index
    @listing = Listing.new
    @listings = Listing.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def create
    byebug
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      flash[:success] = "Listing is successfully created!"
      redirect_to listing_path(@listing)
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
    params.require(:listing).permit(:title, :price, :ratings, :about, :bathroom, :bedroom, :address, :roomtype, images: [])
  end
end
