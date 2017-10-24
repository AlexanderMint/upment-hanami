# frozen_string_literal: true

require_relative 'queries'
require_relative 'mutations'

SCHEMA = GraphQL::Schema.define do
  query Queries::SCHEMA
  mutation Mutations::SCHEMA
end
