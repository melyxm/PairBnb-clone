# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
    20.times do
        user['full_name'] = Faker::Name.name
        user['email'] = Faker::Internet.email

        User.create(user)
    end
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
    40.times do
        listing['bedroom'] = rand(0..5)
        listing['bathroom'] = rand(1..6)
        listing['ratings'] = rand(1..10)

        listing['address'] = Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.zip_code + ', ' + Faker::Address.state + ', ' + Faker::Address.country

        listing['price'] = rand(80..500)
        listing['about'] = Faker::Hipster.sentence
        listing['user_id'] = uids.sample
        Listing.create(listing)
    end
end
