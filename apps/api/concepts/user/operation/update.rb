# frozen_string_literal: true

class User
  class Update < Trailblazer::Operation
    step Policy::Authorized()
    step Policy::Mint(Policy, :update?)

    step Dry::Build(User::Schema::Update)
    step Dry::Validate()

    step Repository(UserRepository, :update)
  end
end
