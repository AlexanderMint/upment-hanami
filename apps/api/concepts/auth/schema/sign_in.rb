# frozen_string_literal: true

class Auth
  module Schema
    class SignIn
      include Hanami::Validations
      predicates Validations::Predicates::Email

      validations do
        required(:email) { filled? & str? & email? }
        required(:password) { filled? & str? }
      end
    end
  end
end
