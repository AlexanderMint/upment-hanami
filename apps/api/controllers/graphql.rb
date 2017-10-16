# frozen_string_literal: true

module Api
  module GraphQL
    private

    def graphql_error(message: '', options: {})
      ::GraphQL::ExecutionError.new(message, options: options)
    end
  end
end
