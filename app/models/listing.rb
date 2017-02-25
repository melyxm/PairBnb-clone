class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  serialize :images, Array
  mount_uploaders :images, ImageUploader
  enum roomtype: {
    undefined: "0",
    shared_room: "1",
    entire_home: "2"
  }

end
