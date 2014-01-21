# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


%w{ yoga rocks swimming lifting flexing }.each { |cat| Category.create(name: cat) }

plan1   = Plan.create(name: "Yoga+", price: "100.00", max_seats: "10", description: "Here is our plan description")
plan2   = Plan.create(name: "Yoga Now", price: "19.99", max_seats: "8", description: "Here is the plan2 description")

plan3   = Plan.create(name: "Super Trainer", price: "20.00", max_seats: "30", description: "Get your own robot trainer")
plan4   = Plan.create(name: "Olympic Style", price: "9.99", max_seats: "18", description: "Bring home the gold")

plan5   = Plan.create(name: "Run With Me", price: "50.00", max_seats: "15", description: "Get ready to run a marathon")
plan6   = Plan.create(name: "Maximum Burn", price: "33.99", max_seats: "6", description: "Get ready for the New Year and shed some of those unwanted calories")
	
plan7   = Plan.create(name: "Yoga all the Time", price: "32.00", max_seats: "22", description: "Around the clock bikram yoga for 2 weeks")
plan8   = Plan.create(name: "Intense Fitness", price: "11.99", max_seats: "124", description: "Maximum fitness intensity workout")

company = Company.create(email: "toms@yoga.com",password:"password")
company.plans << [plan1, plan2]
company.categories << Category.find_by_name("yoga")

	