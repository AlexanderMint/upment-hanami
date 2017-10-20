# frozen_string_literal: true
require_rel 'utils', 'types', 'fields', 'resovers', '../repositories'

Schema = GraphQL::Schema.define do
  query Types::QueryType
  mutation Types::MutationType
end
