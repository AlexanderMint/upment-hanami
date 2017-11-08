# frozen_string_literal: true

class Auth
  module Schema
    class SignUp
      include Hanami::Validations
      predicates Validations::Predicates::Email

      validations do
        required(:email) { filled? & str? & email? }
        required(:password) { filled? & str? & size?(6..60) }

        optional(:first_name) { str? & size?(2..32) }
        optional(:last_name) { str? & size?(2..32) }
        optional(:phone) { int? }
      end
    end
  end
end
