class PairbnbsController < ApplicationController
  def home
    # @reservation = Reservation.new
    if params[:query].present?
    @listings = Listing.search_full_text(params[:query]).order('created_at ASC').paginate(page: params[:page], per_page: 9)
    else
    @listings = Listing.all.order('created_at ASC').paginate(page: params[:page], per_page: 9)
    end
  end
end
