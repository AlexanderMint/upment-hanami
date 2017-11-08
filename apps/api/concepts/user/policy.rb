# frozen_string_literal: true

class User
  class Policy < Trailblazer::Policy
    def index?
      true
    end

    def show?
      @user.id == @params[:id]
    end

    def update?
      @user.id == @params[:id]
    end
  end
end
