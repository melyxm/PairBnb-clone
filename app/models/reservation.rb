class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_overlapping_dates
  validate :check_no_of_guests

  def check_overlapping_dates
    return errors.add(:overlapping_dates, "Must input check in and check out date") if check_in.nil? || check_out.nil?
    # compare this new bookings with other bookings
    listing.reservations.each do |old_reservation|
      if overlap?(self, old_reservation)
        return errors.add(:overlapping_dates, "The booking dates does not match with others")
      end
    end
  end

  def overlap?(x,y)
    (x.check_in - y.check_out) * (y.check_in - x.check_out)
  end

  def check_no_of_guests
    return errors.add(:no_of_guests, "Must input number of guess") if no_of_guests.nil?
    max_guests = listing.no_of_guests
    return if no_of_guests < max_guests
    errors.add(:no_of_guests, "Max guest no exceeded")
  end
end
