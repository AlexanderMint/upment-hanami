# frozen_string_literal: true

class Trailblazer::GraphQL
  def initialize(params = {}, options = {})
    @params, @options = deep_symbolize(params, options)
  end

  def call(operation, *dependencies)
    result = operation.call(@params, @options, *dependencies)

    if result.success?
      result[:model] || result[:collection]
    else
      graphql_error(result[:error])
    end
  end

  private

  def deep_symbolize(*args)
    args.map do |arg|
      Hanami::Utils::Hash.deep_symbolize(arg.to_h)
    end
  end

  def graphql_error(message: '', options: {})
    ::GraphQL::ExecutionError.new(message, options: options)
  end
end
