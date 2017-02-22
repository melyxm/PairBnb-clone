class User < ApplicationRecord
  include Clearance::User
  has_many :listings
  has_many :reservations
  has_many :authentications, :dependent => :destroy


    def self.create_with_auth_and_hash(authentication, auth_hash)
      byebug
        user = User.create!(email: auth_hash["extra"]["raw_info"]["email"])
        user.authentications << (authentication)
        return user
    end

    def fb_token
      x = self.authentications.where(:provider => :facebook).first
      return x.token unless x.nil?
    end

    def password_optional?
      true
    end

end
