# frozen_string_literal: true

module Api::Controllers::Graphql
  class Index
    include Api::Action
    before :restructure_variables

    params do
      required(:query) { filled? & str? }
      optional(:variables).maybe(:hash?)
    end

    def call(params)
      halt 400 unless params.valid?

      status 200, Schema.execute(params[:query],
                                 variables: @variables).to_json
    end

    private

    def restructure_variables(params)
      @variables = Hanami::Utils::Hash.new(params[:variables] || {})
      @variables.stringify!
    end

    def verify_csrf_token?
      false
    end
  end
end
