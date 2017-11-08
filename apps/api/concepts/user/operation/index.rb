# frozen_string_literal: true

class User
  class Index < Trailblazer::Operation
    step Policy::Mint(Policy, :index?)
    step Repository(UserRepository, :all)
  end
end
