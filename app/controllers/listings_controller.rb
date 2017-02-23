class ListingsController < ApplicationController
  def index

  end

  def new
    @listing = Listing.new
  end

  def create
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

  def udpate
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def listing_params
    params.require(:listing).permit(:user_id, :price)
  end
end
