# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/upment'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/'

  model do
    adapter :sql, ENV['DATABASE_URL']

    # Migrations
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/upment/mailers'

    delivery :test
  end

  environment :development do
    logger level: :info
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
