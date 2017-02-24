class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  enum roomtype: {
    undefined: "0",
    shared_room: "1",
    entire_home: "2"
  }
end
