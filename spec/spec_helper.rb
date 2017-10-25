# frozen_string_literal: true

ENV['HANAMI_ENV'] ||= 'test'

# Init hanami
require_relative '../config/environment'
Hanami.boot
Hanami::Utils.require!("#{__dir__}/support")

# Init simplecov
require 'simplecov'
SimpleCov.start

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
