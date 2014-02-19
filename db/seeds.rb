# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Landlord.destroy_all
Apartment.destroy_all
Client.destroy_all
ClientFavorite.destroy_all

granger = User.create(
  email: "grangerabuhoff@gmail.com",
  first_name: "Granger",
  last_name: "Abuhoff",
  account_type: "broker",
  password: "password",
  password_confirmation: "password"
  )

pablo = User.create(
  email: "pablo@bestaptsnyc.com",
  first_name: "Pablo",
  last_name: "Sandoval",
  account_type: "data",
  password: "data",
  password_confirmation: "data"
  )

boss = User.create(
  email: "boss@bestaptsnyc.com",
  first_name: "El",
  last_name: "Jefe",
  account_type: "admin",
  password: "swordfish",
  password_confirmation: "swordfish"
  ) 

tony = Landlord.create(
  name: "Tony Baloney",
  phone_number: "5555555555",
  email: "tony@tonyrealty.com",
  notes: "crazy"
  )

jose = Landlord.create(
  name: "Jose Avilles",
  phone_number: "5555555555",
  email: "jose@joserealty.com",
  notes: ""
  )

# grangers = Apartment.create(
#   address: "355 West 51st",
#   price: 2700,
#   lease_length: 13,
#   bedrooms: 2,
#   bathrooms: 1,
#   description: "recently remodeled",
#   contact_name: "George",
#   phone_number: "1111111111",
#   email: "george@example.com",
#   photo_url: "http://img.streeteasy.com/nyc/image/58/31808058.jpg",
#   landlord_id: Landlord.last.id,
#   neighborhood: "Hell's Kitchen",
#   status: "rented"

#   )



