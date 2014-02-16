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

jose = Landlord.create(
  name: "Jose Avilles",
  phone_number: "5555555555",
  email: "jose@joserealty.com",
  notes: ""
  )

