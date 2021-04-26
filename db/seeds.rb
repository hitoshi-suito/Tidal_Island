2.times do |n|
  name = Faker::Name.name 
  email = Faker::Internet.email
  password = "password"
  User.create!( 
    name: name,
    email: email,
    password: password,
  )
end

User.create!( 
  name:  "admin_user",
  email: "admin@example.com",
  password: "adminadmin",
  password_confirmation: "adminadmin",
  admin: true
)

user = User.create!(
  name:  "normal_user",
  email: "normal@example.com",
  password: "normal",
  password_confirmation: "normal",
  admin: false
)

tide = Tide.find_closest

Blog.create!(
  title: "aaa",
  content: "bbb",
  user_id: user.id,
  tide_id: tide.id
)

# 5.times do |n|
#   title = Faker::Movie.title
#   content = 

# )