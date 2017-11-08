# frozen_string_literal: true

class RefreshToken
  class Destroy < Trailblazer::Operation
    step Policy::Authorized()
    # step Policy::Mint(Policy, :destroy?)

    step Dry::Build(RefreshToken::Schema::Destroy)
    step Dry::Validate()

    step :destroy!
    failure :error

    def destroy!(options, params:, **)
      result = RefreshTokenRepository.new.delete_where(id: params[:id],
                                                       user_id: options[:current_user].id)
      !result.zero?
    end

    def error(options, **)
      options[:error] = { message: 'Forbidden' }
    end
  end
end
