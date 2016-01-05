User.create! name:  "thanh", email: "tiensistorm@gmail.com",
  password: "thanh1", password_confirmation: "thanh1"

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:  name, email: email, password: password,
    password_confirmation: password
end
