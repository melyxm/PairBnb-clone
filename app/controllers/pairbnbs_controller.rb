class PairbnbsController < ApplicationController

  def home
    @reservation = Reservation.new
    @listings = Listing.all.order('created_at DESC').paginate(page: params[:page], per_page: 7)
  end

end
