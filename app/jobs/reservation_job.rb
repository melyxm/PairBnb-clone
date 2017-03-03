class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user, reservation, listing)
    ReservationJob.reservation_email(user, reservation, listing).deliver_now
  end
end
