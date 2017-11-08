# frozen_string_literal: true

class Trailblazer::Policy
  def self.Mint(policy_class, action, name: :default)
    step = ->(_input, options) { Mint.new(policy_class, action).call(options, name) }

    [step, name: "policy.#{name}"]
  end

  class Mint
    def initialize(policy_class, action)
      @policy_class = policy_class
      @action = action
    end

    def call(options, name)
      policy = build_policy(options)
      result = policy.send(@action)

      options[:error] = { message: 'Forbidden' } unless result
      options["policy.#{name}.result"] = Trailblazer::Operation::Result.new(result, policy: policy)

      result
    end

    private

    def build_policy(options)
      @policy_class.new(options)
    end
  end
end
