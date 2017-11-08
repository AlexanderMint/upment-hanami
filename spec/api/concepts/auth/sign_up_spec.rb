# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Auth::SignUp do
  let(:user) { Fabricate.create(:user) }
  let(:params) { Fabricate.build(:user).to_h }
  let(:options) { Hash[request: OpenStruct.new(user_agent: 'Safari')] }

  it 'is successful' do
    response = Auth::SignUp.call(params, options)
    expect(response[:model].email).to eq(params[:email])
  end

  it 'there are access token' do
    response = Auth::SignUp.call(params, options)
    expect(response[:model].access_token).to be_truthy
  end

  it 'there are refresh token' do
    response = Auth::SignUp.call(params, options)
    expect(response[:model].refresh_token).to be_truthy
  end

  it 'not valid parameters' do
    response = Auth::SignUp.call({ email: 'bad_email', password: '123456' }, options)
    expect(response.failure?).to eq true
  end

  it 'unique email' do
    response = Auth::SignUp.call({ email: user.email, password: '123456' }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq('Not a unique email')
  end
end
