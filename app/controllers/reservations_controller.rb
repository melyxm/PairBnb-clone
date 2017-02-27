class ReservationsController < ApplicationController
  def create

  end

  def index
    @reservation = Reservation.find_by(user_id: current_user.id)
  end

  def show
  end

  def new

  end

  def update

  end

  def destroy

  end

end
