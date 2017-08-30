# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 1.0'
gem 'hanami-model', '~> 1.0'
gem 'rake'

gem 'pg'

group :development do
  gem 'rubocop'
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'

  ### Debugger ###
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
