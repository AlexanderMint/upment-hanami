# frozen_string_literal: true

module Fetch
  class Field
    def self.build(model:, type:)
      return_type = type

      GraphQL::Field.define do
        type return_type
        description "Find a #{model.class.name} by ID"
        argument :id, !types.ID, 'ID for Record'
        resolve ->(_obj, args, _ctx) { model.new.find(args[:id]) }
      end
    end
  end
end
