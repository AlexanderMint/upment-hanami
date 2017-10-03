# frozen_string_literal: true

module Api::Controllers::Graphql
  class Index
    include Api::Action

    params do
      required(:query)  { filled? & str? }
      optional(:vairables)  { str? }
    end

    def call(params)
      return status 400, 'Invalid data' unless params.valid?

      status 200, Schema.execute(params[:query],
                                 variables: params[:vairables] || {},
                                 context: { user_id: session[:user_id] }).to_json
    end

    private

    def verify_csrf_token?
      false
    end
  end
end
