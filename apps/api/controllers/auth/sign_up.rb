# frozen_string_literal: true

module Api::Controllers::Auth
  class SignUp
    include Hanami::Validations
    include Api::GraphQL
    predicates Validations::Predicates::Email

    validations do
      required(:email) { filled? & str? & email? }
      required(:password) { filled? & str? & size?(6..60) }

      optional(:first_name) { str? & size?(2..32) }
      optional(:last_name) { str? & size?(2..32) }
      optional(:phone) { int? }
    end

    def call
      if validate.success?
        create_user
      else
        graphql_error(options: validate.errors)
      end
    end

    private

    def create_user
      repository.create_with_tokens(validate.output, name: @options[:request].user_agent)
    rescue Hanami::Model::UniqueConstraintViolationError
      graphql_error(options: { email: ['not unique'] })
    end

    def repository
      @repository ||= UserRepository.new
    end
  end
end
