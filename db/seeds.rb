# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times {
  e = FactoryGirl.create(:event)
  rand(1..5).times {
    FactoryGirl.create(:listing, event_id: e.id)
  }
}

200.times {
  user = User.order("RANDOM()").first
  rand(1..3).times {
    ids = user.flag_ids.push(0)
    listing = Listing.where('listings.id not in(?)', ids).order("RANDOM()").first
    listing.flags.create(user: user,  type_of_flag: Flag::TYPE[rand(0..3)])
  }
}

FactoryGirl.create(:admin, username: 'fotoverite', password: 'password', first_name: 'matthew', last_name: 'bergman')