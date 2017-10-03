# frozen_string_literal: true

# Fix bug: https://github.com/hanami/validations/issues/133
module Hanami
  module Validations
    def initialize(input = {})
      @input = JSON.parse(JSON[input.to_h], symbolize_names: true)
    end
  end
end
