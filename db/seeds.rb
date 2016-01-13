User.create!(name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar",
  activated: true, activated_at: Time.zone.now)

35.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:  name, email: email, password: password,
    password_confirmation: password, activated: true,
    activated_at: Time.zone.now
end

users = User.order(:created_at).take(1)
20.times do
  content = "you've learned 10 words"
  users.each {|user| user.activities.create!(content: content)}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

category_list = [["Basic", "text text text text text text text text text text
  text text text text text text text text text text text text text text text
  text text text text"],
  ["Advance", "text text text text text text text text text text text text
  text text text text text text text text text text text text text text
  text text text"],
  ["Master", "text text text text text text text text text text text text
  text text text text text text text text text text text text text text
  text text text"]]

  category_list.each do |name, description|
    Category.create(name: name, description: description)
  end
