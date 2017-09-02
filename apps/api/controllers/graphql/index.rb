module Api::Controllers::Graphql
  class Index
    include Api::Action

    def call(params)
      status 200, Schema.execute(params[:query],
                                 variables: params[:vairables] || {},
                                 context: { user_id: session[:user_id] }).to_json
    end
  end
end
