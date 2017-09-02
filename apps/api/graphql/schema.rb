# frozen_string_literal: true

UTILS_FILES = (File.dirname(__FILE__) + '/utils/**/*.rb').freeze
TYPES_FILES = (File.dirname(__FILE__) + '/types/**/*_type.rb').freeze
Dir[UTILS_FILES, TYPES_FILES].each { |file| require file }

Schema = GraphQL::Schema.define do
  query Types::QueryType
  mutation Types::MutationType
end
