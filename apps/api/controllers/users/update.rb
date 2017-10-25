# frozen_string_literal: true

module Api::Controllers::Users
  class Update
    include Hanami::Validations
    include Api::GraphQL

    validations do
      required(:id) { filled? & int? }
      required(:first_name) { filled? & str? }
      required(:last_name) { filled? & str? }
    end

    def call
      if validate.success?
        params = validate.output
        repository.update(params.delete(:id), params)
      else
        graphql_error(options: validate.errors)
      end
    end

    private

    def repository
      @repository ||= UserRepository.new
    end
  end
end
