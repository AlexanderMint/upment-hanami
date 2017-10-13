# frozen_string_literal: true

module Api::Controllers::Auth
  class SignUp
    include Hanami::Validations
    predicates Validations::Predicates::Email

    validations do
      required(:email) { filled? & email? }
      required(:password) { filled? & str? & size?(6..60) }

      optional(:first_name) { str? & size?(2..32) }
      optional(:last_name) { str? & size?(2..32) }
      optional(:phone) { int? }
    end

    def call
      if validate.success?
        create_user
      else
        error(options: validate.errors)
      end
    end

    private

    def create_user
      repository.create_with_tokens(validate.output)
    rescue Hanami::Model::UniqueConstraintViolationError
      error(options: { email: ['not unique'] })
    end

    def repository
      @repository ||= UserRepository.new
    end

    def error(message: '', options: {})
      GraphQL::ExecutionError.new(message, options: options)
    end
  end
end
