require 'spec_helper'
require_relative '../../../../apps/api/controllers/graphql/index'

describe Api::Controllers::Graphql::Index do
  let(:action) { Api::Controllers::Graphql::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
