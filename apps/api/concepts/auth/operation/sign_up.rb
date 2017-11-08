# frozen_string_literal: true

class Auth
  class SignUp < Trailblazer::Operation
    # step Policy::Mint(Policy, :sign_up?)

    step Dry::Build(Auth::Schema::SignUp)
    step Dry::Validate()

    step Rescue(Hanami::Model::UniqueConstraintViolationError, handler: :not_unique!) {
      step :sign_up!
    }

    def sign_up!(options, params:, **)
      options[:model] = repository.create_with_tokens(params,
                                                      user_agent: options[:request].user_agent)
    end

    def not_unique!(_exception, options)
      options[:error] = { message: 'Not a unique email' }
    end

    private

    def repository
      @repository ||= UserRepository.new
    end
  end
end
