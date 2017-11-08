# frozen_string_literal: true

class Auth
  class SignIn < Trailblazer::Operation
    # step Policy::Mint(Policy, :sign_in?)

    step Dry::Build(Auth::Schema::SignIn)
    step Dry::Validate()

    step :find_user
    failure :user_not_found, fail_fast: true
    step :sign_in!
    failure :invalid_password

    def find_user(options, params:, **)
      options[:user] = repository.find_by(email: params[:email])
    end

    def sign_in!(options, params:, **)
      return unless BCrypt::Password.new(options[:user].password) == params[:password]

      token = repository.add_refresh_token(options[:user], user_agent: options[:request].user_agent).token
      options[:model] = options[:current_user] = User.new(refresh_token: token, **options[:user])
    end

    ### failure ###

    def user_not_found(options, **)
      options[:error] = { message: 'The user is not found' }
    end

    def invalid_password(options, **)
      options[:error] = { message: 'Incorrect password' }
    end

    private

    def repository
      @repository ||= UserRepository.new
    end
  end
end
