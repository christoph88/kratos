source 'https://rubygems.org'
ruby "2.1.5"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use puma webserver
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# install bower-rails for front end asset management
gem "bower-rails", "~> 0.10.0"
# bootstrap helpers
gem 'bootstrap-sass-extras'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bundler'

gem 'devise', github: 'plataformatec/devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
# omniauthauthentication
gem 'omniauth'
# facebook authentication
gem 'omniauth-facebook'
gem 'binding_of_caller'
# easy liking, up- and downvoting
gem 'acts_as_votable', github: 'ryanto/acts_as_votable'
# create a general rails config file
gem 'config', github: 'railsconfig/config'
gem 'tzinfo-data'
gem 'validates_formatting_of'
# easily set metadata
gem 'meta-tags'
# natural language date/time parser
gem 'chronic'
# gems needed for user uploaded pictures
gem "paperclip", "~> 4.3"
gem 'aws-sdk', '< 2.0'
# add pagination
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'

# Gems for Heroku
gem 'rails_12factor', group: :production

group :development do
  gem 'better_errors'
  gem 'pry-rails'
  gem 'faker'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
end

group :development, :test do
  gem 'dotenv-rails'
end

group :test do
  gem "minitest-rails-capybara"
end
