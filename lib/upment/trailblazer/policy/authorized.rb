# frozen_string_literal: true

class Trailblazer::Policy
  def self.Authorized(name: :current_user)
    step = ->(_input, options) { Authorized.new(options, name).call }

    [step, name: "authorized.#{name}"]
  end

  class Authorized
    def initialize(options, name)
      @options = options
      @name = name
    end

    def call
      @options[:error] = { message: 'Forbidden' } unless auth?

      auth?
    end

    private

    def auth?
      !@options[@name].nil?
    end
  end
end
