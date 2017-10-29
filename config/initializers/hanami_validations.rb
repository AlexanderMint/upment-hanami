# frozen_string_literal: true

# Fix bug: https://github.com/hanami/validations/issues/133
# And added options
module Hanami
  module Validations
    def initialize(input = {}, options = {})
      @options = options
      @input = Hanami::Utils::Hash.deep_symbolize(input.to_h)
    end
  end
end
