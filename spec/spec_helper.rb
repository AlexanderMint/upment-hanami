# frozen_string_literal: true

ENV['HANAMI_ENV'] ||= 'test'

# Init simplecov
require 'simplecov'
require 'codecov'
require_relative 'support/simplecov_hanami_profile'

if ENV['CODECOV_TOKEN']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::HTMLFormatter,
                                                                   SimpleCov::Formatter::Codecov
                                                                 ])
end
SimpleCov.start 'hanami'

# Init hanami and support
require_relative '../config/environment'
Hanami::Utils.require!("#{__dir__}/support")
Hanami.boot

# Rspec config
RSpec.configure do |config|
  config.include RSpec::Hanami::Matchers

  config.before(:suite) do
    DatabaseCleaner.clean_with :deletion
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Fabrication.configure do |config|
  config.fabricator_path = 'spec/api/fabricators'
end
