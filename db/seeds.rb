User.destroy_all

user1 = User.create!(email: 'tom@cat.com', password: '123456', admin: true)

user2 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat2.com', password: '123456', admin: false)
user3 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat3.com', password: '123456', admin: false)
user4 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat4.com', password: '123456', admin: false)
user5 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat5.com', password: '123456', admin: false)
user6 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat6.com', password: '123456', admin: false)
user7 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat7.com', password: '123456', admin: false)
user8 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat8.com', password: '123456', admin: false)
