# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Users::Update do
  let(:action) { Api::Controllers::Users::Update }
  let(:user) { Fabricate.create(:user) }

  it 'is successful' do
    response = action.new(id: user.id, first_name: 'Oleg', last_name: 'Petrov').call

    expect(response.first_name).to eql 'Oleg'
    expect(response.last_name).to eql 'Petrov'
  end
end
