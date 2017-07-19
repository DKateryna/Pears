User.destroy_all
Pair.destroy_all

user1 = User.create!(first_name: "Tom" , last_name: "Cat" ,email: 'tom@cat.com', password: '123456', admin: true)

user2 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat2.com', password: '123456', admin: false)
user3 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat3.com', password: '123456', admin: false)
user4 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat4.com', password: '123456', admin: false)
user5 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat5.com', password: '123456', admin: false)
user6 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat6.com', password: '123456', admin: false)
user7 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat7.com', password: '123456', admin: false)
user8 = User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name ,email: 'tommy@cat8.com', password: '123456', admin: false)

Pair.create!(user: user2, matched_id: user3.id)
Pair.create!(user: user2, matched_id: user4.id)
Pair.create!(user: user2, matched_id: user5.id)
Pair.create!(user: user2, matched_id: user6.id)
Pair.create!(user: user7, matched_id: user2.id)
Pair.create!(user: user7, matched_id: user3.id)
Pair.create!(user: user7, matched_id: user5.id)
Pair.create!(user: user7, matched_id: user6.id)
