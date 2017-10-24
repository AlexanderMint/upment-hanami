require_relative '../../../spec_helper'

describe Api::Controllers::Users::Update do
  let(:action) { Api::Controllers::Users::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
