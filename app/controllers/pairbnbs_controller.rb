class PairbnbsController < ApplicationController

  def home
    @reservation = Reservation.new
  end

end
