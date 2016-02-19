# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
counter = 1
110.times do
  puts "Building product number #{counter}"
    Product.create(
      :name => Faker::Commerce.product_name,
      :price => Faker::Commerce.price,
      :description => Faker::Lorem.sentence
      )
    counter += 1
end

Product.destroy_all