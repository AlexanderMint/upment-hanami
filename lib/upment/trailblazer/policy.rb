# frozen_string_literal: true

class Trailblazer::Policy
  def initialize(current_user: nil, params: nil, **)
    @user = current_user
    @params = params
  end
end
