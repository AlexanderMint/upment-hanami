# frozen_string_literal: true

module Api::Controllers::Graphql
  class Index
    include Api::Action
    before :restructure_variables
    before :set_http_request

    params do
      required(:query) { filled? & str? }
      optional(:variables).maybe(:hash?)
    end

    def call(params)
      halt 400 unless params.valid?

      headers['authorization'] = jwt.new_header_token if jwt.authorized?

      status 200, SCHEMA.execute(params[:query],
                                 variables: @variables,
                                 context: { current_user: jwt.user }).to_json
    end

    private

    def jwt
      @jwt ||= Authentication::Tokens.new(request.get_header('HTTP_AUTHORIZATION') || '')
    end

    def restructure_variables(params)
      # Fix: https://github.com/rmosolgo/graphql-ruby/issues/986#issuecomment-333886921
      @variables = Hanami::Utils::Hash.new(params[:variables] || {})
      @variables.stringify!
    end

    def set_http_request
      $http_request = request
    end

    def verify_csrf_token?
      false
    end
  end
end
