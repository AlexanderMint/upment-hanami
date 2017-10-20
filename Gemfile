# frozen_string_literal: true

source 'https://rubygems.org'

gem 'graphql', '~> 1.7'
gem 'hanami', '1.1.0.rc1'
gem 'hanami-model', '1.1.0.rc1'
gem 'pg', '0.21'
gem 'rake', '~> 12.1'

gem 'rom-repository'

### Security ###
gem 'bcrypt'
gem 'jwt'

group :development do
  gem 'rubocop', require: false
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'

  ### Debugger ###
  gem 'byebug' # fix call in action#call
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rescue'
end

group :test do
  gem 'capybara'
  gem 'minitest'
end

group :production do
  # gem 'puma'
end
