class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.find_by(user_id: current_user.id)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    if @reservation.save
      flash[:success] = "Successfully made reservation"
      redirect_to current_user
    else
      # @errors = @reservation.errors.full_messages
      flash[:danger] = "Failed"
      render "listings/show"
    end
  end


  def show

  end

  def new
    @reservation = current_user.reservations.new
    @listing = Listing.find(params[:listing_id])
  end

  def update

  end

  def destroy

  end

private
  def reservation_params
    params.require(:reservation).permit(:rooms,:no_of_guests, :check_in, :check_out)
  end

end
