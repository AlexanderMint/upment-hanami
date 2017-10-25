# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Api::Controllers::Auth::SignIn do
  let(:action) { Api::Controllers::Auth::SignIn }
  let(:user) { Fabricate.create(:user) }
  let(:sign_in_user) { action.new(email: user.email, password: '123456').call }

  it 'is successful' do
    expect(sign_in_user.class).to eq(User)
  end

  it 'there are access token' do
    expect(sign_in_user.access_token).not_to be_empty
  end

  it 'there are refresh token' do
    expect(sign_in_user.refresh_token).not_to be_empty
  end

  it 'not valid parameters' do
    response = action.new(email: 'bad_email', password: '123456').call
    expect(response.class).to eq(GraphQL::ExecutionError)
  end

  it 'not existing user' do
    response = action.new(email: 'email@email.com', password: '123456').call
    expect(response.class).to eq(GraphQL::ExecutionError)
  end
end
