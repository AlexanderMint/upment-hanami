# frozen_string_literal: true

class User
  module Schema
    class Update
      include Hanami::Validations

      validations do
        required(:id) { filled? & int? }
        required(:first_name) { filled? & str? }
        required(:last_name) { filled? & str? }
      end
    end
  end
end
