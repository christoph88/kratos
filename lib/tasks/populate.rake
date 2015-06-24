namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    make_users
    make_contests
  end
end

def make_users
  User.create!(
    firstname:              "Christoph",
    name:                   "Geypen",
    username:               "chris88",
    bio:                    "He is the best!",
    email:                  "test@test.be",
    password:               "testtest",
    password_confirmation:  "testtest"
  )

  15.times do |n|
    firstname = Faker::Name.first_name
    name      = Faker::Name.last_name
    username  = Faker::Internet.user_name
    bio       = Faker::Lorem.sentence
    email     = "example-#{n+1}@railstutorial.org"
    password  = "longpassword"

    User.create!(
      firstname:              firstname,
      name:                   name,
      username:               username,
      bio:                    bio,
      email:                  email,
      password:               password,
      password_confirmation:  password
    )
  end
end

def make_contests
  users = User.all.limit(5)

  10.times do
    name        = Faker::Team.creature
    description = Faker::Lorem.sentence

    users.each { |user| user.contests.create!(
      name:         name,
      description:  description,
      admin_id:     user.id
    ) }
  end
end

