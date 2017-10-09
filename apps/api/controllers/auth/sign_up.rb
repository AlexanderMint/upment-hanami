# frozen_string_literal: true

module Api::Controllers::Auth
  class SignUp
    include Hanami::Validations
    predicates Validations::Email

    validations do
      required(:email) { email? }
      required(:password) { filled? & str? & size?(6..60) }

      optional(:first_name) { str? & size?(2..32) }
      optional(:last_name) { str? & size?(2..32) }
      optional(:phone) { int? }
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
      changeset = repository.changeset(NewUserChangeset).map(:add_timestamps).data(validate.output)
      repository.create(changeset)
    rescue Hanami::Model::UniqueConstraintViolationError
      GraphQL::ExecutionError.new(email: ['not unique'])
    end

    def repository
      @repository ||= UserRepository.new
    end
  end
end
