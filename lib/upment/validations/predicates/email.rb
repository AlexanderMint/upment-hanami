# frozen_string_literal: true

require 'hanami/validations'

module Validations
  module Predicates
    module Email
      include Hanami::Validations::Predicates

      self.messages_path = 'config/messages.yml'

      EMAIL_FORMAT ||= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

      predicate :email? do |current|
        current.match?(EMAIL_FORMAT)
      end
    end
  end
end
