# frozen_string_literal: true

source 'https://rubygems.org'

gem 'graphql', '~> 1.7'
gem 'hanami', '1.1.0'
gem 'hanami-model', '1.1.0'
gem 'pg', '0.21'
gem 'puma', '~> 3.1'
gem 'rake', '~> 12.3'

gem 'device_detector'
gem 'rom-repository'

### Security ###
gem 'bcrypt'
gem 'jwt'

### Trailblazer
gem 'trailblazer-operation'

group :development do
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'rubocop', require: false

  ### Debugger ###
  gem 'byebug' # fix call in action#call
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'hanami-fabrication'
  gem 'rspec'
  gem 'rspec-hanami'
  gem 'simplecov', require: false
end
