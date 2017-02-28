class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.find_by(user_id: current_user.id)
  end

  def create
    listing = Listing.find_by(params[:id])
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
    @reservation.listing_id
  end


  def show

  end

  def new
    @reservation = Reservation.new
  end

  def update

  end

  def destroy

  end

private
  def reservation_params
    params.require(:reservations).permit(:rooms,:no_of_guests, :check_in, :check_out)
  end

end
