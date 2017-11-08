# frozen_string_literal: true

require_relative '../../../spec_helper'

describe RefreshToken::Destroy do
  let(:user) { Fabricate.create(:user) }
  let(:refresh_token) { Fabricate.create(:refresh_token, user_id: user.id) }
  let(:params) { Hash[id: refresh_token.id] }
  let(:options) { Hash[current_user: user] }

  it 'is successful' do
    response = RefreshToken::Destroy.call(params, options)
    expect(response.success?).to eq true
  end

  it 'without current user' do
    response = RefreshToken::Destroy.call(params, {})
    expect(response.failure?).to eq true
  end

  it 'deleting someone else is token' do
    new_token = Fabricate.create(:refresh_token)

    response = RefreshToken::Destroy.call({ id: new_token.id }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq 'Forbidden'
  end

  it 'non-existent id' do
    response = RefreshToken::Destroy.call({ id: 0 }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq 'Forbidden'
  end

  it 'without params' do
    response = RefreshToken::Destroy.call({}, options)
    expect(response.failure?).to eq true
  end
end
