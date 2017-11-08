# frozen_string_literal: true

class RefreshToken
  module Schema
    class Destroy
      include Hanami::Validations

      validations do
        required(:id) { filled? & int? }
      end
    end
  end
end
