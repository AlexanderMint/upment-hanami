# frozen_string_literal: true

class Trailblazer::Operation
  module Dry
    def self.Validate(name: 'default')
      step = ->(input, options) { Validate.new(input, options, name: name).call }

      [step, name: 'dry.validate']
    end

    class Validate
      def initialize(input, options, name:)
        @options = options
        @params  = input['params']
        @schema  = options["dry.#{name}.schema"]
        @name    = "dry.#{name}"
      end

      def call
        result = @options[@name] = @schema.new(@params).validate

        @options["result.#{@name}"] = Result.new(result.success?, result.errors)
        result.success?
      end
    end
  end
end
