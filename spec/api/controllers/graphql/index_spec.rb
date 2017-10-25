# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../apps/api/controllers/graphql/index'

describe Api::Controllers::Graphql::Index do
  let(:action) { Api::Controllers::Graphql::Index.new }

  it 'is successful' do
    response = action.call(query: 'users{id}', variables: {})
    expect(response[0]).to eq 200
  end

  it 'without parameters' do
    response = action.call({})
    expect(response[0]).to eq 400
  end
end
