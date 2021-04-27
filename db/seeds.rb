10.times do |n|
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

User.create!( 
  name:  "admin2_user",
  email: "admin2@example.com",
  password: "admin2",
  password_confirmation: "admin2",
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
  title: "おやつはやっぱり",
  content: "チョコレート",
  user_id: user.id,
  tide_id: tide.id
)

Blog.create!(
  title: "このあとガッツリ",
  content: "勉強する！！",
  user_id: user.id,
  tide_id: tide.id
)

Blog.create!(
  title: "オススメの場所シェアしよ〜",
  content: "私は実家",
  user_id: user.id,
  tide_id: tide.id
)