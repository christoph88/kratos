namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    make_users
    make_contests
    make_relationships
  end
end

def make_users
  admin = User.create!(
    firstname: "Example firstname",
    name: "Example name",
    username: "Example username",
    bio: "Example bio",
    email: "example@railstutorial.org",
    password: "foobar",
    password_confirmation: "foobar"
  )

  admin.toggle!(:admin)

  99.times do |n|
    firstname = Faker::Name.first_name
    name = Faker::Name.last_name
    username = Faker::Name.user_name
    bio = Faker::Lorem.sentences(3)
    email = "example-#{n+1}@railstutorial.org"
    password = "password"

    User.create!(
      firstname: firstname,
      name: name,
      username: username,
      bio: bio,
      email: email,
      password: password,
      password_confirmation: password
    )
  end
end

#onderstaand moet ik nog bekijken
#def make_contests
  #users = User.all(limit: 6)

  #50.times do
    #content = Faker::Lorem.sentence(5)
    #users.each { |user| user.microposts.create!(content: content) }
  #end
#end

#def make_relationships
  #users = User.all
  #user = users.first

  #followed_users = users[2..50]
  #followers = users[3..40]

  #followed_users.each { |followed| user.follow!(followed) }
  #followers.each       { |follower| follower.follow!(user) }
#end
