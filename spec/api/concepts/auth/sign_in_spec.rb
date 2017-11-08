# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Auth::SignIn do
  let(:user) { Fabricate.create(:user) }
  let(:params) { Hash[email: user.email, password: '123456'] }
  let(:options) { Hash[request: OpenStruct.new(user_agent: 'Safari')] }

  it 'is successful' do
    response = Auth::SignIn.call(params, options)
    expect(response[:model].email).to eq(user.email)
  end

  it 'there are access token' do
    response = Auth::SignIn.call(params, options)
    expect(response[:model].access_token).not_to be_empty
  end

  it 'there are refresh token' do
    response = Auth::SignIn.call(params, options)
    expect(response[:model].refresh_token).not_to be_empty
  end

  it 'not valid parameters' do
    response = Auth::SignIn.call({ email: 'bad_email', password: '123456' }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq('The user is not found')
  end

  it 'not existing user' do
    response = Auth::SignIn.call({ email: 'email@email.ru', password: '123456' }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq('The user is not found')
  end

  it 'invalid password' do
    response = Auth::SignIn.call({ email: user.email, password: 'invalid_password' }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq('Incorrect password')
  end
end
