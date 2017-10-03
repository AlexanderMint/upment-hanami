# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Auth::SignUp do
  let(:action) { Api::Controllers::Auth::SignUp.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
