# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Auth::SignUp do
  let(:action) { Api::Controllers::Auth::SignUp }
  let(:sign_up_user) { action.new(Fabricate.build(:user)).call }

  it 'is successful' do
    expect(sign_up_user.class).to eq(User)
  end

  it 'there are access token' do
    expect(sign_up_user.access_token).not_to be_empty
  end

  it 'there are refresh token' do
    expect(sign_up_user.refresh_token).not_to be_empty
  end

  it 'not valid parameters' do
    response = action.new(email: 'bad_email', password: '123456').call
    expect(response.class).to eq(GraphQL::ExecutionError)
  end
end
