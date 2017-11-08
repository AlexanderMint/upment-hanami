# frozen_string_literal: true

class User
  class Show < Trailblazer::Operation
    step Policy::Authorized()
    step Policy::Mint(Policy, :show?)

    step Repository(UserRepository, :find)
  end
end
