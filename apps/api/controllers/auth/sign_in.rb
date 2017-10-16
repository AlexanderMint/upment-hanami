# frozen_string_literal: true

module Api::Controllers::Auth
  class SignIn
    include Hanami::Validations
    include Api::GraphQL
    predicates Validations::Predicates::Email

    validations do
      required(:email) { filled? & str? & email? }
      required(:password) { filled? & str? }
    end

    def call
      if validate.success?
        find_user_and_token(validate.output)
      else
        graphql_error(options: validate.errors)
      end
    end

    private

    def find_user_and_token(email:, password:)
      user = repository.find_by(email: email)
      return graphql_error(message: 'The user is not found') unless user

      if correct_password?(user.password, password)
        create_refresh_token(user)
      else
        graphql_error(options: { password: ['invalid'] })
      end
    end

    def correct_password?(password_digest, password)
      BCrypt::Password.new(password_digest) == password
    end

    def create_refresh_token(user)
      token = repository.add_refresh_token(user).token
      User.new(refresh_token: token, **user)
    end

    def repository
      @repository ||= UserRepository.new
    end
  end
end
