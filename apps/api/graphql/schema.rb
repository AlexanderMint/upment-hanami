# frozen_string_literal: true

Schema = GraphQL::Schema.define do
  query Types::QueryType
  mutation Types::MutationType
end
