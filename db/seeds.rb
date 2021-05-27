User.create!(name:  "Example User",
    email: "example@trawith.org",
    password:              "foobar",
    password_confirmation: "foobar",
    admin:     true,
    activated: true,
    activated_at: Time.zone.now)
    
User.create!(name:   "テストユーザー",
    email: "testuser@trawith.org",
    password:              "trawith-test",
    password_confirmation: "trawith-test",
    admin:     false,
    activated: true,
    activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@trawith.org"
  introduction = Faker::Lorem.sentence(word_count: 5)
  password = "password"
  User.create!(name:  name,
        email: email,
        introduction: introduction,
        password:              password,
        password_confirmation: password,
        activated: true,
        activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  prefecture = Prefecture.where( 'id >= ?', rand(Prefecture.first.id..Prefecture.last.id) ).first
  split = Split.where( 'id >= ?', rand(Split.first.id..Split.last.id) ).first
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(prefecture_id: prefecture.id, 
                                              split_id: split.id, 
                                              content: content) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
