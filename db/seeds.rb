20.times do |n|
  name = Faker::Name.name 
  email = Faker::Internet.email
  password = "password"
  User.create!( name: name,
                email: email,
                password: password,
              )
end

User.create!( name:  "admin_user",
              email: "admin@example.com",
              password:              "adminadmin",
              password_confirmation: "adminadmin",
              admin: true
            )

User.create!( name:  "normal_user",
            email: "normal@example.com",
            password:              "normal",
            password_confirmation: "normal",
            admin: false
          )

# Tide.create!( low_start_hour: Time.now.hour,
#               low_start_min: Time.now.min,
#               low_end_hour: Time.now.hour,
#               low_end_min: Time.now.min + 30,
#               year: Time.now.year,
#               month: Time.now.month,
#               day: Time.now.day
#             )

# Blog.create!( title: "aaa",
#               content: "bbb",
#               user_id: 1,
#               tide_id: 1
# )          

# 5.times do |n|
#   title = Faker::Movie.title
#   content = 

# )