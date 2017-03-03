class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = @listing.id
    if @reservation.save
      ReservationJob.perform_later(@reservation, @listing)
      flash[:success] = "Successfully made reservation"
      redirect_to payment_new_path(@reservation.id)
    else
      # @errors = @reservation.errors.full_messages
      @errors = @reservation.errors.full_messages
      render "listings/show"
    end
  end


  def show

  end

  def new
    @reservation = Reservation.new
    @listing = Listing.find(params[:listing_id])
  end

  def update

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @reservation.user
  end

private
  def reservation_params
    params.require(:reservation).permit(:rooms, :no_of_guests, :check_in, :check_out, :user_id, :listing_id)
  end

end
