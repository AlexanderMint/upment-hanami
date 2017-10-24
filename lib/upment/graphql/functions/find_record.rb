# frozen_string_literal: true

module Functions
  class FindRecord < GraphQL::Function
    attr_reader :type

    def initialize(model:, type:)
      @model = model
      @type = type
    end

    argument :id, GraphQL::ID_TYPE

    def call(_obj, args, _ctx)
      repository.find(args[:id])
    end

    private

    def repository
      @repository ||= @model.new
    end
  end
end
