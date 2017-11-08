# frozen_string_literal: true

Fabricator(:refresh_token) do
  user_id { Fabricate(:user).id }
  token { SecureRandom.uuid }
  user_agent { sequence(:user_agent) { |i| "Safari-#{i}" } }
end
