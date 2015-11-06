namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    make_users
    make_contests
    make_submissions
  end

  task pusers: :environment do
    make_users
  end

  task pcontests: :environment do
    make_contests
  end

  task psubmissions: :environment do
    make_submissions
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
      password_confirmation:  password,
      data_source:            "rake_populate"
    )
  end
end

def make_contests
  users = User.all.limit(5)

  10.times do
    name        = Faker::Team.creature
    description = Faker::Lorem.sentence

    users.each do |user|
      user.contests.create!(
      name:         name,
      description:  description,
      admin_id:     user.id,
      ctype_id:     1,
      data_source:  "rake_populate")
    end

  end
end

def make_submissions
  users = User.all.limit(15)
  contests = Contest.where(data_source: "rake_populate")

  contests.each do |contest|

    users.each do |user| 
      contest.submissions.create!(
        reps:         rand(1..20),
        weight:       rand(100..350),
        user_id:      user.id,
        contest_id:   contest.id,
        data_source:  "rake_populate"
      )
    end

  end
end
