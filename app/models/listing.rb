class Listing < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :reservations
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  mount_uploaders :images, ImageUploader
  enum roomtype: {
    undefined: "0",
    shared_room: "1",
    entire_home: "2"
  }

  pg_search_scope :search_full_text,
  :using => {
    :tsearch => { :any_word => true }
    },
     :against => {
      :title => 'A',
      :about => 'B'
    }

end
