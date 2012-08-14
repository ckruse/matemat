# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if %w{development test}.include?(Rails.env)
  10.times do |i|
    usr = User.create! username: "ckruse-#{i}", display_name: "Christian Kruse #{i}",
      email: "cjk+#{i}@wwwtech.de", password: "123"
    Account.create! :user_id => usr.user_id
  end

  10.times do |i|
    Product.create! name: "Produkt #{i}", price_chf: 2.0, price_eur: 1.67
  end
end

# eof
