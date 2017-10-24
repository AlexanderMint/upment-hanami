# frozen_string_literal: true

module Types
  module Enum
    ORDER_TYPE = GraphQL::EnumType.define do
      name 'Order'
      description 'Sorting order'

      value 'desc', 'In descending order'
      value 'asc',  'In ascending order'
    end
  end
end
