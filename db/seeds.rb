User.destroy_all

user1 = User.create!(email: 'tom@cat.com', password: '123456', admin: true)

user2 = User.create!(email: 'tommy@cat2.com', password: '123456', admin: false)
user3 = User.create!(email: 'tommy@cat3.com', password: '123456', admin: false)
user4 = User.create!(email: 'tommy@cat4.com', password: '123456', admin: false)
user5 = User.create!(email: 'tommy@cat5.com', password: '123456', admin: false)
user6 = User.create!(email: 'tommy@cat6.com', password: '123456', admin: false)
user7 = User.create!(email: 'tommy@cat7.com', password: '123456', admin: false)
user8 = User.create!(email: 'tommy@cat8.com', password: '123456', admin: false)
