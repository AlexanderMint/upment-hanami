# frozen_string_literal: true

module Api::Controllers::Auth
  class SignUp
    include Hanami::Validations
    predicates Validations::Email

    validations do
      required(:first_name) { filled? & str? & size?(2..64) }
      required(:last_name) { filled? & str? & size?(2..64) }
      required(:email) { email? }
    end

    def call
      if validate.success?
        create_user
      else
        GraphQL::ExecutionError.new(validate.errors)
      end
    end

    private

    def create_user
      UserRepository.new.create(validate.output)
    rescue Hanami::Model::UniqueConstraintViolationError
      GraphQL::ExecutionError.new(email: ['not unique'])
    end
  end
end
