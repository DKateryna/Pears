User.destroy_all

user1 = User.create!(email: 'tom@cat.com', password: 'meowmeow', admin: true)
user1 = User.create!(email: 'tommy@cat.com', password: 'meowmeow!', admin: false)
