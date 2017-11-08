# frozen_string_literal: true

class Trailblazer::Operation
  module Dry
    def self.Build(schema, name: 'default')
      step = ->(_input, options) { Build.for(schema, options, name: name) }

      [step, name: 'dry.build']
    end

    class Build
      def self.for(schema, options, name: 'default')
        options["dry.#{name}.schema"] = schema
      end
    end
  end
end
