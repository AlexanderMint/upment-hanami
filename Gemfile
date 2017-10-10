# frozen_string_literal: true

source 'https://rubygems.org'

gem 'graphql', '~> 1.7'
gem 'hanami', '1.1.0.beta3'
gem 'hanami-model', '1.1.0.beta3'
gem 'pg', '0.21'
gem 'rake', '~> 12.1'

gem 'rom-repository'

### Security ###
gem 'bcrypt', require: false

group :development do
  gem 'rubocop'
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'

  ### Debugger ###
  # gem 'pry'
  # gem 'pry-byebug'
  # gem 'pry-rescue'
  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'minitest'
end

group :production do
  # gem 'puma'
end
