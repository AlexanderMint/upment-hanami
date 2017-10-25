# frozen_string_literal: true

Fabricator(:user) do
  first_name { sequence(:first_name) { |i| "Ivan#{i}" } }
  last_name { sequence(:last_name) { |i| "Smirnov#{i}" } }
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password BCrypt::Password.create('123456')
end
