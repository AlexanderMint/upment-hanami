# frozen_string_literal: true

module GraphQL
  class ExecutionError < GraphQL::Error
    attr_accessor :message

    def initialize(message)
      @message = message
    end
  end
end
